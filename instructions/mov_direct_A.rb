class MOV_direct_A < Instruction
  def mnemonic
    "MOV direct, A"
  end

  def size
    2
  end

  def encoding
    ["11110101", "direct"]
  end
end
