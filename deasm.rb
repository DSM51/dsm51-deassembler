require 'yaml'
require 'awesome_print'
require 'optparse'

require './binary'
require './instruction'
require './format'
require './parser'
require './decompiler'


Dir.glob('instructions/*').each do |file|
	require "./" + file
end

class String
	def pad(size, sign = "0")
		sign * (size-self.size).abs + self
	end
end

class Fixnum
  def hex(bits=8)
		if self < 0
			"-" + (-self).to_s(16).pad(bits/8*2)
		else
			self.to_s(16).pad(bits/8*2)
		end
  end

  def bin(len=8)
    to_s(2).pad(len)
  end
end


def normalize(content)
	content
		.split("\n")
		.map { |line|
			begin
				m = line.match(/^([0-9a-fA-F]{4}):\s([0-9a-fA-F]{2})$/)
				[m[1], m[2]]
			rescue
				nil
			end
		}
		.reject(&:nil?)
end



options = { verbose: false }

parser = OptionParser.new do |opts|
  opts.banner = "Usage: deasm.rb [options]"

  opts.on("--[no-]verbose") do |v|
    options[:verbose] = v
  end

	opts.on("--file=FILE") do |file|
		options[:file] = file
	end

	opts.on("--first=ADDRESS") do |first|
		options[:first] = first
	end

	opts.on("--last=ADDRESS") do |last|
		options[:last] = last
	end

	opts.on("--entry=ENTRY") do |entry|
		options[:entries] ||= []
		options[:entries] << entry
	end

	opts.on("-h", "--help") do
		puts opts
		exit
	end
end

parser.parse!


unless File.exists? options[:file]
	puts "file not found"
	exit 1
end

content = File.read(options[:file])
first = (options[:first] || "0x0000").to_i(16)
last = (options[:last] || "0xffff").to_i(16)
entries = (options[:entries] || ["0x0000"])
						.map { |entry| entry.to_i(16) }
						.select { |entry| entry >= first }
						.select { |entry| entry <= last }
						.sort

puts "first: #{first.hex(16)}"
puts "last: #{last.hex(16)}"
puts "entries:"

entries.each do |entry|
	puts "  - 0x#{entry.hex(16)}"
end


puts "format: #{File.extname(options[:file])}"


case File.extname(options[:file]).downcase
when '.hex'
	parser = Parser.new
	block = parser.parse(content)

when '.lst'
	data = content
		.split(/\s/)
		.map.with_index { |c,i| [i.hex(16),c] }

	data = Hash[data]
	block = (first..last)
		.map { |address| address.hex(16) }
		.map { |address| [address.to_i(16), (data[address] || "ff").to_i(16)] }


	block = Hash[block]
else
	data = Hash[normalize(content)]

	block = (first..last)
		.map { |address| address.hex(16) }
		.map { |address| [address.to_i(16), (data[address] || "ff").to_i(16)] }

	block = Hash[block]
end


binary = Binary.new(block, first: first, last: last)
instructions = Instruction.all.map(&:new)
decompiler = Decompiler.new(instructions, binary, entries: entries)

# instructions.each do |instruction|
# 	puts " -> #{instruction.mnemonic}"
# end


decompiler.run
decompiler.code
