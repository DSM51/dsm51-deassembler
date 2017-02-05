class MOV_A_atRi < Instruction
  def mnemonic
    "MOV A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1110011i"]
  end
end
