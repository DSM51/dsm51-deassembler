class SJMP_offset < Instruction
  def mnemonic
    "SJMP offset"
  end

  def size
    2
  end

  def encoding
    ["10000000", "offset"]
  end

  def format(pc, *opcodes)
    "sjmp #{relative8(opcodes[1], pc+size)}"
  end

  def jumps(pc, *opcodes)
    address = pc + size + opcodes[1]
    [ address ]
  end
end
