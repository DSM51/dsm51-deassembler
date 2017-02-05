class LJMP_address16 < Instruction
	size 3
	single 0x02

	def decode(binary, pc)
		"ljmp #{direct16(binary[(pc+1)..(pc+2)])}"
	end

	def jumps(binary, pc)
		address16 = binary[pc+1]*256 + binary[pc+2]
		[address16]
	end
end
