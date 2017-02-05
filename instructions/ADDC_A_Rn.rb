class ADDC_A_Rn < Instruction
  def mnemonic
    "ADDC A, Rn"
  end

  def size
    1
  end

  def encoding
    ["00111nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "addc A, R#{n}"
  end

end
