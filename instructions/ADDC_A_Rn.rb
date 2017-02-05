class ADDC_A_Rn < Instruction
  def mnemonic
    "ADDC A, Rn"
  end

  def size
    1
  end

  def encoding
    ["00111nnn"]
  end
end
