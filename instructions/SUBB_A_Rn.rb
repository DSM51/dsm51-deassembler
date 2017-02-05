class SUBB_A_Rn < Instruction
  def mnemonic
    "SUBB A, Rn"
  end

  def size
    1
  end

  def encoding
    ["10011nnn"]
  end
end
