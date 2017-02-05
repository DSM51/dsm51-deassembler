class MOV_A_Rn < Instruction
  def mnemonic
    "MOV A, Rn"
  end

  def size
    1
  end

  def encoding
    ["11101nnn"]
  end
end
