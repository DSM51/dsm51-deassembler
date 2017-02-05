class ORL_C_bit < Instruction
  def mnemonic
    "ORL C, bit"
  end

  def size
    2
  end

  def encoding
    ["01110010", "bit"]
  end
end
