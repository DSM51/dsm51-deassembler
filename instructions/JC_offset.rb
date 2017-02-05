class JC_offset < Instruction
  def mnemonic
    "JC offset"
  end

  def size
    2
  end

  def encoding
    ["01000000", "offset"]
  end

  def format(pc, *opcodes)
    "jc #{relative8(opcodes[1], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[1])]
  end

end
