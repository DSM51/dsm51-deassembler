class CJNE_A_data8_rel8 < Instruction
	size 3
	single 0b1011_0100

	def decode(binary, pc)
		"cjne A, #{data8(binary[pc+1])}, #{relative8(binary[pc+2], pc+size)}"
	end

	def jumps(binary, pc)
		target = pc + size + binary[pc+2]
		super + [target]
	end
end
