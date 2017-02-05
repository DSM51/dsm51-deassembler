class MOV_Rn_data < Instruction
	size 2
	single_mask 0b1111_1000, 0b0111_1000

	def decode(binary, pc)
		index = binary[pc] & 0b0000_0111
		data = binary.hex(pc+1, 1)
		"mov R#{index}, #{data}"
	end
end
