class SUBB_A_atRi < Instruction
  def mnemonic
    "SUBB A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1001011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "subb A, @R#{i}"
  end
end
