class JNC_offset < Instruction
  def mnemonic
    "JNC offset"
  end

  def size
    2
  end

  def encoding
    ["01010000", "offset"]
  end
end
