class JNC_rel8 < Instruction
	size 2
	single 0b0101_0000

	def decode(binary, pc)
		"jnc #{relative8(binary[pc+1], pc+size)}"
	end
end
