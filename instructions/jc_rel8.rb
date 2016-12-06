class JC_rel8 < Instruction
	size 2
	single 0b0100_0000

	def decode(binary, pc)
		"jc #{relative8(binary[pc+1], pc+size)}"
	end

	def jumps(binary, pc)
		target = pc + size + signed(binary[pc+1])
		super + [target]
	end
end
