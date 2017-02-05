class MOVX_A_atDPTR < Instruction
  def mnemonic
    "MOVX A, @DPTR"
  end

  def size
    1
  end

  def encoding
    ["11100000"]
  end
end
