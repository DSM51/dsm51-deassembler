class POP_direct8 < Instruction
	size 2
	single 0b1101_0000

	def decode(binary, pc)
		"pop #{direct8(binary[pc+1])}"
	end
end
