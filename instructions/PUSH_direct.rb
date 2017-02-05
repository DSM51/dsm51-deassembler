class PUSH_direct < Instruction
  def mnemonic
    "PUSH direct"
  end

  def size
    2
  end

  def encoding
    ["11000000", "direct"]
  end
end
