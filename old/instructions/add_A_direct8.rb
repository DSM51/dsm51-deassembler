class ADD_A_direct8 < Instruction
	size 2
	single 0b0010_0101

	def decode(binary, pc)
		"add A, #{direct8(binary[pc+1])}"
	end
end
