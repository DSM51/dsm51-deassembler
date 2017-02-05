class INC_Rn < Instruction
  def mnemonic
    "INC Rn"
  end

  def size
    1
  end

  def encoding
    ["00001nnn"]
  end
end
