class MOV_direct_atRn < Instruction
	size 1
	single_mask 0b1111_1110, 0b10000110

	def decode(binary, pc)
		index = binary[pc] & 0b00000001
		"mov A, @R#{index}"
	end
end
