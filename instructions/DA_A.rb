class DA_A < Instruction
  def mnemonic
    "DA A"
  end

  def size
    1
  end

  def encoding
    ["11010100"]
  end

  def format(pc, *opcodes)
    "da A"
  end
end
