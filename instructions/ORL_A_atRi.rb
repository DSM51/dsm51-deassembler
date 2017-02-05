class ORL_A_atRi < Instruction
  def mnemonic
    "ORL A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0100011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "orl A, @R#{i}"
  end
end
