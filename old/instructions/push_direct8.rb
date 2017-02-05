class PUSH_direct8 < Instruction
	size 2
	single 0b1100_0000

	def decode(binary, pc)
		"push #{direct8(binary[pc+1])}"
	end
end
