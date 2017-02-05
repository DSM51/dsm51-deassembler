class POP_direct < Instruction
  def mnemonic
    "POP direct"
  end

  def size
    2
  end

  def encoding
    ["11010000", "direct"]
  end

  def format(pc, *opcodes)
    "pop #{direct8(opcodes[1])}"
  end
end
