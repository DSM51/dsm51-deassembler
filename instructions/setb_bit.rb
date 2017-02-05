class SETB_bit < Instruction
  def mnemonic
    "SETB bit"
  end

  def size
    2
  end

  def encoding
    ["11010010", "bit"]
  end

  def format(pc, *opcodes)
    "setb #{bit8(opcodes[1])}"
  end

end
