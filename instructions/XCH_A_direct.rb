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
end
