class JZ_rel < Instruction
	info "jump if accumulator zero"
	size 2

	single 0x60

	def decode(binary, pc)
		"jz #{relative8(binary[pc+1], pc+size)}"
	end

	def jumps(binary, pc)
		target = pc + size + binary[pc+1]
		super + [target]
	end
end
