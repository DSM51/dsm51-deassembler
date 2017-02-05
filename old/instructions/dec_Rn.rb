class DEC_Rn < Instruction
	size 1
	single_mask 0b1111_1000, 0b0001_1000

	def decode(binary, pc)
		index = binary[pc] & 0b0000_0111
		"dec R#{index}"
	end
end
