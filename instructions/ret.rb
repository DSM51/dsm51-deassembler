class RET < Instruction
	size 1
	single 0b0010_0010

	def decode(binary, pc)
		"ret"
	end

	def jumps(binary, pc)
		[]
	end
end
