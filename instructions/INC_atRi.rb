class INC_atRi < Instruction
  def mnemonic
    "INC @Ri"
  end

  def size
    1
  end

  def encoding
    ["0000011i"]
  end
end
