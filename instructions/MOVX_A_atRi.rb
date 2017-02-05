class MOVX_A_atRi < Instruction
  def mnemonic
    "MOVX A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1110001i"]
  end
end
