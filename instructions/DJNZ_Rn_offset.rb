class DJNZ_Rn_offset < Instruction
  def mnemonic
    "DJNZ Rn, offset"
  end

  def size
    2
  end

  def encoding
    ["11011nnn", "offset"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "djnz R#{n}, #{relative8(opcodes[1], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[1])]
  end

end
