class CJNE_Rn_immediate_offset < Instruction
  def mnemonic
    "CJNE Rn, #immediate, offset"
  end

  def size
    3
  end

  def encoding
    ["10111nnn", "immediate", "offset"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "cjne R#{n}, #{immediate8(opcodes[1])}, #{relative8(opcodes[2], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[2])]
  end
end
