class INC_Ri < Instruction
	size 1

	single_mask 0b1111_1000, 0b0000_1000

	def decode(binary, pc)
		index = binary[pc] & 0b0000_0111
		"inc R#{index}"
	end
end
