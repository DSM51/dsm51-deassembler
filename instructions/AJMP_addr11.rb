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
    low = opcodes[1]
    high = (opcodes[0] & 0b1110_0000) >> 5
    current = pc & 0b1110_0000

    address = (high|current)*256+low
    [address]
  end

  def format(pc, *opcodes)
    low = opcodes[1]
    high = (opcodes[0] & 0b1110_0000) >> 5
    current = pc & 0b1110_0000

    # address = (high|current)*256+low

    "ajmp #{low}"
  end
end
