class CPL_bit < Instruction
  def mnemonic
    "CPL bit"
  end

  def size
    2
  end

  def encoding
    ["10110010", "bit"]
  end
end
