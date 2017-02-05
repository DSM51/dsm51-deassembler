class MOV_atRn_immediate < Instruction
  def mnemonic
    "MOV @Rn, #immediate"
  end

  def size
    2
  end

  def encoding
    ["0111011n", "immediate"]
  end
end
