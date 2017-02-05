class ADDC_A_atRi < Instruction
  def mnemonic
    "ADDC A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0011011i"]
  end
end
