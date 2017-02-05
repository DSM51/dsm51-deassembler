def direct16(high, low)
	addr = high*256 + low
	"$ #{addr.hex(16)}h"
end

def immediate8(value)
	"# #{value.hex(8)}h"
end

def immediate16(high, low)
	value = high*256+low
	"# #{value.hex(16)} (#{value})"
end

def direct8(address)
	map = {
		0x81 => 'SP',
		0x82 => 'DPL',
		0x83 => 'DPH',

		0x87 => 'PCON',
		0x88 => 'TCON',
		0x89 => 'TMOD',
		0x8a => 'TL0',
		0x8b => 'TL1',
		0x8c => 'TH0',
		0x8d => 'TH1',

		0x90 => 'P1',
		0x98 => 'SCON',
		0x99 => 'SBUF',

		0xa8 => 'IE',

		0xb0 => 'P3',
		0xb8	=>	'IP',
		0xd0 => 'PSW',
		0xe0 => 'ACC'
	}

	map[address] || "$ " + address.to_s(16).pad(2)
end



def data8(binary)
	"# 0x#{binary.to_s(16).pad(2)}"
end

def data16(binary)
	"# 0x#{(binary[0]*256+binary[1]).to_s(16).pad(4)}"
end

def relative8(offset, from)
	offset = signed8(offset)

	"$ #{offset.hex(8)}h (#{(from+offset).hex(16)})"
end

def text8(byte)
	return byte.chr if byte >= 32 && byte <= 126
	'.'
end

def relative11(offset, from)
	current = from & 0b1111_1000_0000_0000
	target = current|offset

	"$ #{offset.hex(11)}h (#{target.hex(16)})"
end

def signed8(address)
	if (address & 0b1000_000) == 0b1000_000
		(address & 0b0111_1111) - 128
	else
		address
	end
end


def bit8(address)
	map = {
		0xa9 => 'ET0',
		0xaf => 'EA',

		0x8c => 'TR0', #
		0x8d => 'TF0', #
		0x8e => 'TR1', #
		0x8f => 'TF1', #


		0xac => 'ES',
		0xbc => 'PS'
	}

	map[address] || "0x" + address.to_s(16).pad(2)
end
