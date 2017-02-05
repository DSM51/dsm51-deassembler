class DJNZ_direct_offset < Instruction
  def mnemonic
    "DJNZ direct, offset"
  end

  def size
    3
  end

  def encoding
    ["11010101", "direct", "offset"]
  end
end
