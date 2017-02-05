class MUL_AB < Instruction
  def mnemonic
    "MUL AB"
  end

  def size
    1
  end

  def encoding
    ["10100100"]
  end
end
