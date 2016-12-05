class MOV_C_bit < Instruction
	size 2

	single 0b1010_0010

	def decode(binary, pc)
		bit_address = binary.hex(pc+1, 1)
		"mov C, #{bit_address}"
	end
end
