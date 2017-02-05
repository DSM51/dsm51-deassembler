class MOV_direct_data < Instruction
	size 3

	single 0b0111_0101

	def decode(binary, pc)
		"mov #{direct8(binary[pc+1])}, #{data8(binary[pc+2])}"
	end
end
