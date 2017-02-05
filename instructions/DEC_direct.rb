class DEC_direct < Instruction
  def mnemonic
    "DEC direct"
  end

  def size
    2
  end

  def encoding
    ["00010101", "direct"]
  end
end
