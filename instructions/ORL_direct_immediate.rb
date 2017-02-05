class ORL_direct_immediate < Instruction
  def mnemonic
    "ORL direct, #immediate"
  end

  def size
    3
  end

  def encoding
    ["01000011", "direct", "immediate"]
  end
end
