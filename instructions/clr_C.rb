class CLR_C < Instruction
	size 1
	single 0b1100_0011

	def decode(binary, pc)
		"clr C"
	end
end
