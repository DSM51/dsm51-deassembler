class CJNE_atRi_immediate_offset < Instruction
  def mnemonic
    "CJNE @Ri, #immediate, offset"
  end

  def size
    3
  end

  def encoding
    ["1011011i", "immediate", "offset"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])

    "cjne @R#{i}, #{immediate8(opcodes[1])}, #{relative8(opcodes[2], pc+size)}"
  end

  def jumps(pc, *opcodes)
    super + [pc+size+signed8(opcodes[2])]
  end
end
