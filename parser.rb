class Parser
	class Line
		attr_reader :content

		def initialize(content)
			@content = content
		end

		def size
			content[1..2].to_i(16)
		end

		def address
			content[3..6].to_i(16)
		end

		def type
			content[7..8].to_i(16)
		end

		def data
			content[9..-3]
				.split("")
				.each_slice(2)
				.map(&:join)
				.map{|x|x.to_i(16)}
		end

		def checksum
			content[-2..-1].to_i(16)
		end

		def crc
			content[1..-1]
				.split("")
				.each_slice(2)
				.map(&:join)
				.map{|x|x.to_i(16)}
				.inject(0, :+) % 256
		end
	end

	def parse(content)
		content = content.split("\n").map do |line|
			r = Line.new(line)
			fail "crc" unless r.crc + r.checksum + 1 != 0
			r
		end

		# content.each do |line|
			# puts "#{line.type} @#{line.address}"
		# end

		Binary.new interpret(content)
	end

	def interpret(records)
		last = records.max { |a,b| a.address <=> b.address }
		length = last.address + last.size

		data = [ 0x00 ] * length

		records.each do |r|
			next if r.type == 1

			r.data.each_with_index do |d,i|
				data[r.address + i] = d
			end
		end

		data
	end
end
