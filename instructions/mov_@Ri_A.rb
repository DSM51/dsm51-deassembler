class MOV_atRi_A < Instruction
	size 1

	single_mask 0b1111_1110, 0b1111_0110

	def decode(binary, pc)
		index = binary[pc] & 0x1
		"mov @R#{index}, A"
	end
end
