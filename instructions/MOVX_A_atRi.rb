class MOVX_A_atRi < Instruction
  def mnemonic
    "MOVX A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1110001i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "movx A, @R#{i}"
  end
end
