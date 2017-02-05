class RRC_A < Instruction
  def mnemonic
    "RRC A"
  end

  def size
    1
  end

  def encoding
    ["00010011"]
  end
end
