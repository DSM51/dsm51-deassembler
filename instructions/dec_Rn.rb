class DEC_Rn < Instruction
  def mnemonic
    "DEC Rn"
  end

  def size
    1
  end

  def encoding
    ["00011nnn"]
  end
end
