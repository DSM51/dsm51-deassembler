class JBC_bit_offset < Instruction
  def mnemonic
    "JBC bit, offset"
  end

  def size
    3
  end

  def encoding
    ["00010000", "bit", "offset"]
  end
end
