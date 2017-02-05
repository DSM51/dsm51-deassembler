class ORL_A_immediate < Instruction
  def mnemonic
    "ORL A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01000100", "immediate"]
  end
end
