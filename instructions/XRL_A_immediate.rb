class XRL_A_immediate < Instruction
  def mnemonic
    "XRL A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01100100", "immediate"]
  end
end
