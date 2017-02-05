class MOV_Rn_immediate < Instruction
  def mnemonic
    "MOV Rn, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01111nnn", "immediate"]
  end
end
