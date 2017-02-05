class ANL_A_immediate < Instruction
  def mnemonic
    "ANL A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01010100", "immediate"]
  end
end
