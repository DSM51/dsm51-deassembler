class MOV_atRi_A < Instruction
  def mnemonic
    "MOV @Ri, A"
  end

  def size
    1
  end

  def encoding
    ["1111011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "mov @R#{i}, A"
  end
end
