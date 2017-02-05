class CJNE_A_immediate_offset < Instruction

  def mnemonic
    "CJNE A, #immediate, offset"
  end

  def size
    3
  end

  def encoding
    ["10110100", "immediate", "offset"]
  end

  def format(pc, *opcodes)
    "cjne a, #{immediate8(opcodes[1])}, #{relative8(opcodes[2], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[2])]
  end
end
