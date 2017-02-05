class JB_bit_offset < Instruction
  def mnemonic
    "JB bit, offset"
  end

  def size
    3
  end

  def encoding
    ["00100000", "bit", "offset"]
  end
end
