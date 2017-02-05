class JNC_offset < Instruction
  def mnemonic
    "JNC offset"
  end

  def size
    2
  end

  def encoding
    ["01010000", "offset"]
  end

  def format(pc, *opcodes)
    "jnc #{relative8(opcodes[1], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[1])]
  end
end
