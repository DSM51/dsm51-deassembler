#!/usr/bin/env ruby

require './parser'



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
