class DJNZ_Rn_offset < Instruction
  def mnemonic
    "DJNZ Rn, offset"
  end

  def size
    2
  end

  def encoding
    ["11011nnn", "offset"]
  end
end
