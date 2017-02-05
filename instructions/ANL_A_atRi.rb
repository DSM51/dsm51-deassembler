class ANL_A_atRi < Instruction
  def mnemonic
    "ANL A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0101011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "anl A, @R#{i}"
  end

end
