class CJNE_A_direct_offset < Instruction
  def mnemonic
    "CJNE A, direct, offset"
  end

  def size
    3
  end

  def encoding
    ["10110101", "direct", "offset"]
  end
end
