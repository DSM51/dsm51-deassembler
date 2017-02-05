class CLR_C < Instruction
  def mnemonic
    "CLR C"
  end

  def size
    1
  end

  def encoding
    ["11000011"]
  end

  def format(pc, *opcodes)
    "clr C"
  end
end
