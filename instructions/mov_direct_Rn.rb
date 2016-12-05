class MOV_direct_Rn < Instruction
	size 2
	single_mask 0b1111_1000, 0b1000_1000

	def decode(binary, pc)
		index = binary[pc] & 0b0000_0111
		direct = binary.hex(pc+1, 1)
		"mov #{direct}, R#{index}"
	end
end
