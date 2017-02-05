class ANL_direct_A < Instruction
  def mnemonic
    "ANL direct, A"
  end

  def size
    2
  end

  def encoding
    ["01010010", "direct"]
  end

  def format(pc, *opcodes)
    "anl #{direct8(opcodes[1])}, A"
  end

end
