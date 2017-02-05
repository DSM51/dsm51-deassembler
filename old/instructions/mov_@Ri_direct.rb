class MOV_atRi_direct < Instruction
	size 1

	single_mask 0b1111_1110, 0b1010_0110

	def decode(binary, pc)
		index = binary[pc] & 0x1
		direct = binary.hex(pc+1, 1)
		"mov @R#{index}, #{direct}"
	end
end
