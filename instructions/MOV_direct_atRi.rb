class MOV_direct_atRi < Instruction
  def mnemonic
    "MOV direct, @Rn"
  end

  def size
    2
  end

  def encoding
    ["1000011i", "direct"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "mov #{direct8(opcodes[1])}, @R#{i}"
  end
end
