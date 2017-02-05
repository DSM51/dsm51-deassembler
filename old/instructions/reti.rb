class RETI < Instruction
	size 1
	single 0b0011_0010

	def decode(binary, pc)
		"reti"
	end

	def jumps(binary, pc)
		[]
	end
end
