class RETI < Instruction
  def mnemonic
    "RETI"
  end

  def size
    1
  end

  def encoding
    ["00110010"]
  end
end
