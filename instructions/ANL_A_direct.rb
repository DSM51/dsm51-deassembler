class ANL_A_direct < Instruction
  def mnemonic
    "ANL A, direct"
  end

  def size
    2
  end

  def encoding
    ["01010101", "direct"]
  end
end
