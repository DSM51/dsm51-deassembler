class DJNZ_direct_offset < Instruction
  def mnemonic
    "DJNZ direct, offset"
  end

  def size
    3
  end

  def encoding
    ["11010101", "direct", "offset"]
  end

  def format(pc, *opcodes)
    "djnz #{direct8(opcodes[1])}, #{relative8(opcodes[2], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[2])]
  end

end
