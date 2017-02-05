class ORL_A_direct8 < Instruction
	size 2
	single 0b0100_0101

	def decode(binary, pc)
		"orl A, #{direct8(binary[pc+1])}"
	end
end
