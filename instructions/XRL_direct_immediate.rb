class XRL_direct_immediate < Instruction
  def mnemonic
    "XRL direct, #immediate"
  end

  def size
    3
  end

  def encoding
    ["01100011", "direct", "immediate"]
  end
end
