class DJNZ_Rn_rel8 < Instruction
	size 2
	single_mask 0b1111_1000, 0b1101_1000

	def decode(binary, pc)
		index = binary[pc] & 0b0000_0111
		"djnz R#{index}, #{relative8(binary[pc+1], pc+size)}"
	end

	def jumps(binary, pc)
		target = pc + size + signed(binary[pc+1])
		super + [target]
	end
end
