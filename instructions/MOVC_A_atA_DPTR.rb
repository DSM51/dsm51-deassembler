class MOVC_A_atA_DPTR < Instruction
  def mnemonic
    "MOVC A, @A+DPTR"
  end

  def size
    1
  end

  def encoding
    ["10010011"]
  end
end
