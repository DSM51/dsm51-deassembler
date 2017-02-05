class CLR_A < Instruction
  def mnemonic
    "CLR A"
  end

  def size
    1
  end

  def encoding
    ["11100100"]
  end

  def format(pc, *opcodes)
    "clr A"
  end
end
