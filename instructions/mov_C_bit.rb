class MOV_C_bit < Instruction
  def mnemonic
    "MOV C, bit"
  end

  def size
    2
  end

  def encoding
    ["10100010", "bit"]
  end
end
