class JBC_bit_offset < Instruction
  def mnemonic
    "JBC bit, offset"
  end

  def size
    3
  end

  def encoding
    ["00010000", "bit", "offset"]
  end

  def format(pc, *opcodes)
    "jbc #{bit8(opcodes[1])}, #{relative8(opcodes[2], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[2])]
  end

end
