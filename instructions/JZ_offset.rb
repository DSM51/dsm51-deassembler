class JZ_offset < Instruction
  def mnemonic
    "JZ offset"
  end

  def size
    2
  end

  def encoding
    ["01100000", "offset"]
  end

  def format(pc, *opcodes)
    "jz #{relative8(opcodes[1], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[1])]
  end
end
