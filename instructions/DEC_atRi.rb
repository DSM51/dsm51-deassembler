class DEC_atRi < Instruction
  def mnemonic
    "DEC @Ri"
  end

  def size
    1
  end

  def encoding
    ["0001011i"]
  end
end
