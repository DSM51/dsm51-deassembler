class LCALL_addr16 < Instruction
  def mnemonic
    "LCALL addr16"
  end

  def size
    3
  end

  def encoding
    ["00010010", "addr[15-8]", "addr[7-0]"]
  end

  def format(pc, *opcodes)
    "lcall #{direct16(opcodes[1], opcodes[2])}"
  end

  def jumps(pc, *opcodes)
    address = opcodes[1]*256+opcodes[2]
    super + [address]
  end
end
