class JNZ_offset < Instruction
  def mnemonic
    "JNZ offset"
  end

  def size
    2
  end

  def encoding
    ["01110000", "offset"]
  end
end
