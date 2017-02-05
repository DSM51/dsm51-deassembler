class SWAP_A < Instruction
	size 1
	single 0b1100_0100

	def decode(binary, pc)
		"swap A"
	end
end
