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
end
