class MOV_A_direct < Instruction
	size 2
	single 0b1110_0101

	# warning "mov A,ACC is not a valid Instruction."

	def decode(binary, pc)
		"mov A, #{direct8(binary[pc+1])}"
	end
end
