class MOV_direct_A < Instruction
	size 2
	single 0b1111_0101

	def decode(binary, pc)
		"mov #{direct8(binary[pc+1])}, A"
	end
end
