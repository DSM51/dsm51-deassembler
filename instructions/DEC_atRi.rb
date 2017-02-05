class DEC_atRi < Instruction
  def mnemonic
    "DEC @Ri"
  end

  def size
    1
  end

  def encoding
    ["0001011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "dec @R#{i}"
  end
end
