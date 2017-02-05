class MOV_atRi_immediate < Instruction
  def mnemonic
    "MOV @Rn, #immediate"
  end

  def size
    2
  end

  def encoding
    ["0111011i", "immediate"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "mov @R#{i}, #{immediate8(opcodes[1])}"
  end
end
