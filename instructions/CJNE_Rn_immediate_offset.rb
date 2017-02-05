class CJNE_Rn_immediate_offset < Instruction
  def mnemonic
    "CJNE Rn, #immediate, offset"
  end

  def size
    3
  end

  def encoding
    ["10111nnn", "immediate", "offset"]
  end
end
