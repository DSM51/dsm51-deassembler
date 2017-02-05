class ORL_A_Rn < Instruction
  def mnemonic
    "ORL A, Rn"
  end

  def size
    1
  end

  def encoding
    ["01001nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "orl A, R#{n}"
  end
end
