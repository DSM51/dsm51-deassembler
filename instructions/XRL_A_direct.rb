class XRL_A_direct < Instruction
  def mnemonic
    "XRL A, direct"
  end

  def size
    2
  end

  def encoding
    ["01100101", "direct"]
  end
end
