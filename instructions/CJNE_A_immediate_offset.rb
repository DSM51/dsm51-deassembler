class CJNE_A_immediate_offset < Instruction
  def mnemonic
    "CJNE A, #immediate, offset"
  end

  def size
    3
  end

  def encoding
    ["10110100", "immediate", "offset"]
  end
end
