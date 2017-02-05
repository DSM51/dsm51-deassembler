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
end
