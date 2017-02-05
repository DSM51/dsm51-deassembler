class MOVX_atRi_A < Instruction
  def mnemonic
    "MOVX @Ri, A"
  end

  def size
    1
  end

  def encoding
    ["1111001i"]
  end
end
