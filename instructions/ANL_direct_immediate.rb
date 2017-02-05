class ANL_direct_immediate < Instruction
  def mnemonic
    "ANL direct, #immediate"
  end

  def size
    3
  end

  def encoding
    ["01010011", "direct", "immediate"]
  end

  def format(pc, *opcodes)
    "anl #{direct8(opcodes[1])}, #{immediate8(opcodes[2])}"
  end

end
