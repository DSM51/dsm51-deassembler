class AJMP_addr11 < Instruction
  def mnemonic
    "AJMP addr11"
  end

  def size
    2
  end

  def encoding
    ["iii00001", "addr[7-0]"]
  end

  def jumps(pc, *opcodes)
    current = pc & 0b1110_0000_0000_0000

    low = opcodes[1]
    high = (opcodes[0] & 0b1110_0000) >> 5
    address = high*256+low

    [current|address]
  end

  def format(pc, *opcodes)
    low = opcodes[1]
    high = (opcodes[0] & 0b1110_0000) >> 5
    address = high*256+low
    current = pc & 0b1110_0000_0000_0000

    "ajmp #{relative11(address, pc+2)}"
  end
end
