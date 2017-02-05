class ANL_C_notbit < Instruction
  def mnemonic
    "ANL C, /bit"
  end

  def size
    2
  end

  def encoding
    ["10110000", "bit"]
  end
end
