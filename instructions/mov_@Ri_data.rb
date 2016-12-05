class MOV_atRi_data < Instruction
	size 1

	single_mask 0b1111_1110, 0b0111_0110

	def decode(binary, pc)
		index = binary[pc] & 0x1
		data = binary.hex(pc+1, 1)
		"mov @R#{index}, #{data}"
	end
end
