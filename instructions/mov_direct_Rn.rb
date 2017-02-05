class MOV_direct_Rn < Instruction
  def mnemonic
    "MOV direct, Rn"
  end

  def size
    2
  end

  def encoding
    ["10001nnn", "direct"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "mov #{direct8(opcodes[1])}, R#{n}"
  end
end
