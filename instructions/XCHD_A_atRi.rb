class XCHD_A_atRi < Instruction
  def mnemonic
    "XCHD A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1101011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "xchd A, @R#{i}"
  end
end
