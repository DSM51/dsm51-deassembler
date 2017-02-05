class RLC_A < Instruction
  def mnemonic
    "RLC A"
  end

  def size
    1
  end

  def encoding
    ["00110011"]
  end
end
