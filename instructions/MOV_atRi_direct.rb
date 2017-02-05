class MOV_atRi_direct < Instruction
  def mnemonic
    "MOV @Ri, direct"
  end

  def size
    2
  end

  def encoding
    ["1010011i", "direct"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "mov @R#{i}, #{direct8(opcodes[1])}"
  end
end
