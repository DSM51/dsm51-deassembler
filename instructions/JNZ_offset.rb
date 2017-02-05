class JNZ_offset < Instruction
  def mnemonic
    "JNZ offset"
  end

  def size
    2
  end

  def encoding
    ["01110000", "offset"]
  end

  def format(pc, *opcodes)
    "jnz #{relative8(opcodes[1], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[1])]
  end
end
