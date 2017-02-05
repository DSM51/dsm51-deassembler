class SJMP_offset < Instruction
  def mnemonic
    "SJMP offset"
  end

  def size
    2
  end

  def encoding
    ["10000000", "offset"]
  end
end
