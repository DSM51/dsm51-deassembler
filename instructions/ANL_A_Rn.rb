class ANL_A_Rn < Instruction
  def mnemonic
    "ANL A, Rn"
  end

  def size
    1
  end

  def encoding
    ["01011nnn"]
  end
end
