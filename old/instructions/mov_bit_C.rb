class MOV_bit_C < Instruction
	size 2

	single 0b1001_0010

	def decode(binary, pc)
		bit_address = binary.hex(pc+1, 1)
		"mov #{bit_address}, C"
	end
end
