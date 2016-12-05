class SETB_bit < Instruction
	size 2
	single 0xd2

	def decode(binary, pc)
		"setb #{bit_address8(binary[pc+1])}"
	end
end
