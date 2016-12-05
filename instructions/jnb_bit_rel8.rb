class JNB_bit_rel8 < Instruction
	size 3

	single 0x30

	def decode(binary, pc)
		bit = binary.hex(pc+1, 1)
		"jnb #{bit}, #{relative8(binary[pc+2], pc+size)}"
	end

	def jumps(binary, pc)
		target = pc + size + binary[pc+2]
		super + [target]
	end
end
