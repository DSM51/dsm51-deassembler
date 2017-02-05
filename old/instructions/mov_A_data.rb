class MOV_A_data < Instruction
	size 2
	single 0b0111_0100

	def decode(binary, pc)
		"mov A, #" + binary.hex(pc+1, 1)
	end
end
