class ORL_direct8_A < Instruction
	size 2
	single 0b01000010

	def decode(binary, pc)
		"orl #{direct8(binary[pc+1])}, A"
	end
end
