class LJMP_addr16 < Instruction
  def mnemonic
    "LJMP addr16"
  end

  def size
    3
  end

  def encoding
    ["00000010", "addr[15-8]", "addr[7-0]"]
  end

  def jumps(pc, *opcodes)
    address = opcodes[1]*256+opcodes[2]
    [address]
  end
end
