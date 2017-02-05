class XCH_A_direct < Instruction
  def mnemonic
    "XCH A, direct"
  end

  def size
    2
  end

  def encoding
    ["11000101", "direct"]
  end

  def format(pc, *opcodes)
    "xch A, #{direct8(opcodes[1])}"
  end
end
