class RET < Instruction
  def mnemonic
    "RET"
  end

  def size
    1
  end

  def encoding
    ["00100010"]
  end

  def format(pc, *opcodes)
    "ret"
  end

  def jumps(pc, *opcodes)
    []
  end
end
