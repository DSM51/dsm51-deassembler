class RETI < Instruction
  def mnemonic
    "RETI"
  end

  def size
    1
  end

  def encoding
    ["00110010"]
  end

  def format(pc, *opcodes)
    "reti"
  end

  def jumps(pc, *opcodes)
    []
  end
end
