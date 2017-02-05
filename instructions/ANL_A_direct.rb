class ANL_A_direct < Instruction
  def mnemonic
    "ANL A, direct"
  end

  def size
    2
  end

  def encoding
    ["01010101", "direct"]
  end

  def format(pc, *opcodes)
    "anl A, #{direct8(opcodes[1])}"
  end

end
