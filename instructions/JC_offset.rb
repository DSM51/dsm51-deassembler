class JC_offset < Instruction
  def mnemonic
    "JC offset"
  end

  def size
    2
  end

  def encoding
    ["01000000", "offset"]
  end
end
