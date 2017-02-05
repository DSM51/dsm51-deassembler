class ORL_C_notbit < Instruction
  def mnemonic
    "ORL C, /bit"
  end

  def size
    2
  end

  def encoding
    ["10100000", "bit"]
  end
end
