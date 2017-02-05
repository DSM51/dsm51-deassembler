class SUBB_A_immediate < Instruction
  def mnemonic
    "SUBB A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["10010100", "immediate"]
  end
end
