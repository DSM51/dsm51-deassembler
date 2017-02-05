class INC_direct < Instruction
	size 2

	single 0b00000101

	def decode(binary, pc)
		"inc #{direct8(binary[pc+1])}"
	end
end
