class MOV_DPTR_data16 < Instruction
	size 3
	single 0b1001_0000

	def decode(binary, pc)
		data = binary[(pc+1)..(pc+2)]
		"mov DPTR, #{data16(data)}"
	end
end
