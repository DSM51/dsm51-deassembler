class XRL_A_Rn < Instruction
  def mnemonic
    "XRL A, Rn"
  end

  def size
    1
  end

  def encoding
    ["01101nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "xrl A, R#{n}"
  end
end
