class MOV_atRi_A < Instruction
  def mnemonic
    "MOV @Ri, A"
  end

  def size
    1
  end

  def encoding
    ["1111011i"]
  end
end
