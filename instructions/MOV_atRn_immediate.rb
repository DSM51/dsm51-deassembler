class MOV_atRn_immediate < Instruction
  def mnemonic
    "MOV @Rn, #immediate"
  end

  def size
    2
  end

  def encoding
    ["0111011n", "immediate"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "mov @R#{n}, #{immediate8(opcodes[1])}"
  end
end
