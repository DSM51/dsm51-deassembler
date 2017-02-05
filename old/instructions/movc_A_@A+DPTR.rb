class MOV_A_atA_plusDPTR < Instruction
	size 1
	single 0b1001_0011

	def decode(binary, pc)
		"movc A, @A+DPTR"
	end
end
