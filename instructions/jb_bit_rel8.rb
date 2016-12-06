class JB_bit_rel8 < Instruction
	size 3
	single 0b0010_0000

	def decode(binary, pc)
		bit = bit_address8(binary[pc+1])
		rel = relative8(binary[pc+2], pc+size)
		"jb #{bit}, #{rel}"
	end

	def jumps(binary, pc)
		target = pc + size + signed(binary[pc+2])
		super + [target]
	end
end
