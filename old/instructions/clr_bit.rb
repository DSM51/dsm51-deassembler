class CLR_bit < Instruction
	size 2
	single 0xc2

	def decode(binary, pc)
		bit = binary.hex(pc+1, 1)
		"clr #{bit}"
	end
end
