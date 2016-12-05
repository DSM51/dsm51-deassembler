class MOV_A_atRn < Instruction
	size 1
	single_mask 0b1111_1110, 0b1110_0110

	def decode(binary, pc)
		index = binary[pc] & 0x1
		"mov A, @R#{index}"
	end
end
