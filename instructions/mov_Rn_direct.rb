class MOV_Rn_direct < Instruction
  def mnemonic
    "MOV Rn, direct"
  end

  def size
    2
  end

  def encoding
    ["10101nnn", "direct"]
  end
end
