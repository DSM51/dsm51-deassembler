class ANL_C_bit < Instruction
  def mnemonic
    "ANL C, bit"
  end

  def size
    2
  end

  def encoding
    ["10000010", "bit"]
  end
end
