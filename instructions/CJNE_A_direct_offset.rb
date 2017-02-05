class CJNE_A_direct_offset < Instruction
  def mnemonic
    "CJNE A, direct, offset"
  end

  def size
    3
  end

  def encoding
    ["10110101", "direct", "offset"]
  end

  def format(pc, *opcodes)
    "cjne #{direct8(opcodes[1])}, #{relative8(opcodes[2], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[2])]
  end
end
