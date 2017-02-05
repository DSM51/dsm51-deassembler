class JZ_offset < Instruction
  def mnemonic
    "JZ offset"
  end

  def size
    2
  end

  def encoding
    ["01100000", "offset"]
  end
end
