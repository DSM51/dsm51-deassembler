class MOV_direct_atRn < Instruction
  def mnemonic
    "MOV direct, @Rn"
  end

  def size
    2
  end

  def encoding
    ["1000011n", "direct"]
  end
end
