class DIV_AB < Instruction
  def mnemonic
    "DIV AB"
  end

  def size
    1
  end

  def encoding
    ["10000100"]
  end

  def format(pc, *opcodes)
    "div ab"
  end
end
