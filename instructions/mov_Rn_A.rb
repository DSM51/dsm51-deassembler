class MOV_Rn_A < Instruction
	size 1
	single_mask 0b1111_1000, 0b1111_1000

	def decode(binary, pc)
		index = binary[pc] & 0x1
		"mov R#{index}, A"
	end
end
