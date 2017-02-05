class JNZ_rel8 < Instruction
	size 2
	single 0b0111_0000

	def decode(binary, pc)
		"jnz #{relative8(binary[pc+1], pc+size)}"
	end

	def jumps(binary, pc)
		target = pc + size + signed(binary[pc+1])
		super + [target]
	end
end
