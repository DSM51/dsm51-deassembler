class ANL_A_Rn < Instruction
  def mnemonic
    "ANL A, Rn"
  end

  def size
    1
  end

  def encoding
    ["01011nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "anl A, R#{n}"
  end

end
