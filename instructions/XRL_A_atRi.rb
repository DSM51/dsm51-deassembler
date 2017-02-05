class XRL_A_atRi < Instruction
  def mnemonic
    "XRL A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0110011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "xrl A, @R#{i}"
  end
end
