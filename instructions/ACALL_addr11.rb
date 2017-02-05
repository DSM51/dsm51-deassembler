class ACALL_addr11 < Instruction
  def mnemonic
    "ACALL addr11"
  end

  def size
    2
  end

  def encoding
    ["iii10001", "addr[7-0]"]
  end

  def format(pc, *opcodes)
    low = opcodes[1]
    high = (opcodes[0] & 0b1110_0000) >> 5
    address = high*256+low

    "acall #{relative11(address, pc+size)}"
  end

  def jumps(pc, *opcodes)
    low = opcodes[1]
    high = (opcodes[0] & 0b1110_0000) >> 5
    address = high*256+low

    current = pc & 0b1110_0000_0000_0000
    target = current|address

    super + [target]
  end

end
