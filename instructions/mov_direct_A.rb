class MOV_direct_A < Instruction
  def mnemonic
    "MOV direct, A"
  end

  def size
    2
  end

  def encoding
    ["11110101", "direct"]
  end

  def format(pc, *opcodes)
      "mov #{direct8(opcodes[1])}, A"
  end
end
