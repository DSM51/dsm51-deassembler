class SETB_bit < Instruction
  def mnemonic
    "SETB bit"
  end

  def size
    2
  end

  def encoding
    ["11010010", "bit"]
  end
end
