class MOV_atRi_direct < Instruction
  def mnemonic
    "MOV @Ri, direct"
  end

  def size
    2
  end

  def encoding
    ["1010011i", "direct"]
  end
end
