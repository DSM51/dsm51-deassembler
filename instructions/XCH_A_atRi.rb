class XCH_A_atRi < Instruction
  def mnemonic
    "XCH A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1100011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "xch A, @R#{i}"
  end
end
