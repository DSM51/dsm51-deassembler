class ADDC_A_direct < Instruction
  def mnemonic
    "ADDC A, direct"
  end

  def size
    2
  end

  def encoding
    ["00110101", "direct"]
  end
end
