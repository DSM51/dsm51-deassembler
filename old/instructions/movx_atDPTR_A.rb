class MOVX_atDPTR_A < Instruction
	size 1
	single 0b1111_0000

	def decode(binary, pc)
		data = binary[(pc+1)..(pc+2)]
		"movx @DPTR, A"
	end
end
