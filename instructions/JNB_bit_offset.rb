class JNB_bit_offset < Instruction
  def mnemonic
    "JNB bit, offset"
  end

  def size
    3
  end

  def encoding
    ["00110000", "bit", "offset"]
  end
end
