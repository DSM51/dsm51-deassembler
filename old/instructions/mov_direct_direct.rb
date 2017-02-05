class MOV_direct_direct < Instruction
	size 3
	single 0b1000_0101

	def decode(binary, pc)
		src = binary.hex(pc+1, 1)
		dst = binary.hex(pc+2, 1)
		"mov #{src}, #{dst}"
	end
end
