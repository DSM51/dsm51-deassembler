class MOV_Rn_A < Instruction
  def mnemonic
    "MOV Rn, A"
  end

  def size
    1
  end

  def encoding
    ["11111nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "mov R#{n}, A"
  end

end
