#!/usr/bin/env ruby

require './parser'


class String
	def pad(size, sign = "0")
		sign * (size-self.size) + self
	end
end

def data8(binary)
	"# 0x#{binary.to_s(16).pad(2)}"
end

def data16(binary)
	"# 0x#{(binary[0]*256+binary[1]).to_s(16).pad(4)}"
end

def relative8(relative, from)
	"+#{relative} (0x#{(from+relative).to_s(16).pad(4)})"
end

def bit_address8(address)
	map = {
		0xa9 => 'ET0',
		0xaf => 'EA',

		0x8d => 'TF0',
		0x8f => 'TF1'

	}

	map[address] || "0x" + address.to_s(16).pad(2)
end


def direct8(address)
	map = {
		0x8a => 'TL0',
		0x8b => 'TL1',
		0x8c => 'TH0',

		0x88 => 'TCON',
		0x89 => 'TMOD',

		0xa8 => 'IE',

		0xe0 => 'ACC',
		0xd0 => 'PSW'
	}

	map[address] || "0x" + address.to_s(16).pad(2)
end

def direct16(binary)
	"0x" + (binary[0]*0xff+binary[1]).to_s(16).pad(4)
end

class Binary
	attr_reader :data, :pc

	def initialize(data)
		@data = data
		@responsibilities = {}
		set_responsibility 0, :code
	end

	def at(position, length)
		data[position...(position+length)]
	end

	def hex(position, length)
		"0x" + at(position, length).map do |byte|
			byte.to_s(16).pad(2)
		end.join
	end

	def address16(position)
		at(position, 2)
	end

	def address8(position)
		at(position, 1)[0]
	end

	def [](index)
		data[index]
	end

	def set_responsibility(pc, type)
		@responsibilities[pc] = type
	end

	def responsibility_of(pc)
		@responsibilities[pc] || :unknown
	end

	def size
		data.size
	end
end



class Instruction
	def self.inherited(klass)
		@all ||= []
		@all << klass
	end

	def self.all
      @all || []
    end

	def self.info(message)
		define_method :info do
			message
		end
	end

	def self.single(byte)
		define_method :check do |binary, pc|
			binary.data[pc] == byte
		end
	end

	def self.single_mask(mask, byte)
		define_method :check do |binary, pc|
			(binary[pc] & mask) == byte
		end
	end

	def self.size(length)
		define_method :size do
			length
		end
	end

	def info
		"?"
	end

	def check(binary, pc)
		fail "not implemented"
	end

	def size
		fail "not implemented"
	end

	def decode(binary, pc)
		fail "not implemented"
	end

	def jumps(binary, pc)
		address = pc + size
		[address]
	end
end



Dir.glob('instructions/*').each do |file|
	require "./" + file
end




class LCALL_address16 < Instruction
	size 3

	def check(binary, pc)
		binary.data[pc] == 0x12
	end

	def decode(binary, pc)
		address = binary.hex(pc+1, 2)
		"lcall #{address}"
	end

	def jumps(binary, pc)
		address = binary.address16(pc+1)
		[address[0]*256 + address[1]] + super
	end
end





class ADD_A_data < Instruction
	size 2

	def check(binary, pc)
		binary.data[pc] == 0x24
	end

	def decode(binary, pc)
		data = binary.hex(pc+1, 1)
		"add A, #{data}"
	end
end

class DEC_direct < Instruction
	size 2

	def check(binary, pc)
		binary.data[pc] == 0x15
	end

	def decode(binary, pc)
		direct = binary.hex(pc+1, 1)
		"dec #{direct}"
	end
end



class ANL_A_data < Instruction
	size 2

	def check(binary, pc)
		binary.data[pc] == 0x54
	end

	def decode(binary, pc)
		data = binary.hex(pc+1, 1)
		"anl A, #{data}"
	end
end

class ORL_direct_data < Instruction
	size 3

	def check(binary, pc)
		binary.data[pc] == 0x43
	end

	def decode(binary, pc)
		direct = binary.hex(pc+1, 1)
		data = binary.hex(pc+2, 1)
		"orl #{direct}, #{data}"
	end
end

class ANL_direct_data < Instruction
	size 3

	def check(binary, pc)
		binary.data[pc] == 0x53
	end

	def decode(binary, pc)
		direct = binary.hex(pc+1, 1)
		data = binary.hex(pc+2, 1)
		"anl #{direct}, #{data}"
	end
end



class NOP < Instruction
	size 1

	def check(binary, pc)
		binary.data[pc] == 0x00
	end

	def decode(binary, pc)
		"nop"
	end
end

class JBC_bit_rel < Instruction
	size 3

	def check(binary, pc)
		binary.data[pc] == 0x10
	end

	def decode(binary, pc)
		bit = binary.hex(pc+1, 1)
		rel = binary.hex(pc+2, 1)
		"jbc #{bit}, #{rel}"
	end
end

class CLR_A < Instruction
	size 1

	def check(binary, pc)
		binary.data[pc] == 0xe4
	end

	def decode(binary, pc)
		"clr A"
	end
end

class INC_AT_Ri < Instruction
	size 1

	def check(binary, pc)
		binary.data[pc] == 0b0000_0110 || binary.data[pc] == 0b0000_0111
	end

	def decode(binary, pc)
		var = binary.data[pc] & 0x01

		"inc R#{var}"
	end
end



class Decompiler
	attr_reader :binary, :instructions

	def initialize(binary)
		@binary = binary
		@instructions = Instruction.all.map(&:new)
		@output = {}
	end

	def test
		# puts binary.data

		check = [0x00]
		checked = []

		while not check.empty? do
			pc = check.shift

			next if checked.include? pc

			checked << pc

			# puts " -> #{pc.to_s(16).pad(4)}"

			found = false

			instructions.each do |instruction|
				next unless instruction.check(binary, pc)

				(0...instruction.size).each do |offset|
					binary.set_responsibility(pc+offset, :code)
				end

				@output[pc] = instruction

				jumps = instruction.jumps(binary, pc)

				jumps.each do |address|
					binary.set_responsibility address, :code
					check << address unless checked.include? address
				end

				found = true
			end

			if !found && pc < binary.size
				puts "!!! => #{binary.hex(pc, 1)}"
				# exit
				sleep 1
			end
		end

		pc = 0
		entry = []

		while pc < binary.size do
			instruction = @output[pc]
			resp = binary.responsibility_of(pc).to_s
			resp = resp.pad("unknown".size, ' ')


			if instruction.nil?
				puts "#{pc.to_s(16).pad(4)} | #{resp} | ? -> 0x#{binary.data[pc].to_s(16).pad(2)}"
				entry << pc if binary.responsibility_of(pc) == :code
				pc += 1
				next
			end

			string = instruction.decode(binary, pc)

			puts "#{pc.to_s(16).pad(4)} | #{resp} | #{string}" # #{"".pad(30-string.size, " ")}; #{instruction.info}

			pc += instruction.size
		end

		puts "unknown code entries:"
		entry.each do |e|
			puts " - #{e.to_s(16).pad(4)}"
		end
	end
end


#

def usage
	puts "./main.rb <hex file>"
end

def decompile(content)
	parser = Parser.new
	binary = parser.parse content
	decompiler = Decompiler.new(binary)
	decompiler.test
end

#
# main
#

file = ARGV[0]


if file.nil?
	usage
elsif File.exists? file
	decompile File.read file
else
	puts "! file not found"
end
