class INC_Rn < Instruction
  def mnemonic
    "INC Rn"
  end

  def size
    1
  end

  def encoding
    ["00001nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "inc R#{n}"
  end
end
