class RL_A < Instruction
	size 1
	single 0b0010_0011

	def decode(binary, pc)
		"rl A"
	end
end
