class SUBB_A_Rn < Instruction
  def mnemonic
    "SUBB A, Rn"
  end

  def size
    1
  end

  def encoding
    ["10011nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "subb A, R#{n}"
  end
end
