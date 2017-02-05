class ADD_A_Rn < Instruction
  def mnemonic
    "ADD A, Rn"
  end

  def size
    1
  end

  def encoding
    ["00101nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "add A, R#{n}"
  end

end
