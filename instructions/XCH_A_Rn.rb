class XCH_A_Rn < Instruction
  def mnemonic
    "XCH A, Rn"
  end

  def size
    1
  end

  def encoding
    ["11001nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "xch A, @#{n}"
  end
end
