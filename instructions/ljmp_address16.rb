class LJMP_address16 < Instruction
	size 3
	single 0x02

	def decode(binary, pc)
		"ljmp #{direct16(binary[(pc+1)..(pc+2)])}"
	end

	def jumps(binary, pc)
		address = binary.address16(pc+1)
		[address[0]*256 + address[1]]
	end
end
