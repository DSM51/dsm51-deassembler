class ANL_A_immediate < Instruction
  def mnemonic
    "ANL A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01010100", "immediate"]
  end

  def format(pc, *opcodes)
    "anl A, #{immediate8(opcodes[1])}"
  end

end
