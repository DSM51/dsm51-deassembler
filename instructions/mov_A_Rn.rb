class MOV_A_Rn < Instruction
  def mnemonic
    "MOV A, Rn"
  end

  def size
    1
  end

  def encoding
    ["11101nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "mov A, R#{n}"
  end

end
