class ORL_A_direct < Instruction
  def mnemonic
    "ORL A, direct"
  end

  def size
    2
  end

  def encoding
    ["01000101", "direct"]
  end
end
