class MOV_direct_Rn < Instruction
  def mnemonic
    "MOV direct, Rn"
  end

  def size
    2
  end

  def encoding
    ["10001nnn", "direct"]
  end
end
