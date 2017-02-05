class MOV_A_Rn < Instruction
	size 1
	single_mask 0b1111_1000, 0b1110_1000

	def decode(binary, pc)
		index = (binary[pc] & 0b00000111)
		"mov A, R#{index}"
	end
end
