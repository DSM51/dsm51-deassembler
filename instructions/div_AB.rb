class DIV_AB < Instruction
	size 1
	single 0b1000_0100

	def decode(binary, pc)
		"div AB"
	end
end
