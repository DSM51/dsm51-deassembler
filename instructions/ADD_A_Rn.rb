class ADD_A_Rn < Instruction
  def mnemonic
    "ADD A, Rn"
  end

  def size
    1
  end

  def encoding
    ["00101nnn"]
  end
end
