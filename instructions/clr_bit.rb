class CLR_bit < Instruction
  def mnemonic
    "CLR bit"
  end

  def size
    2
  end

  def encoding
    ["11000010", "bit"]
  end

  def format(pc, *opcodes)
    "clr #{bit8(opcodes[1])}"
  end
end
