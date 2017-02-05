class MOV_Rn_direct < Instruction
  def mnemonic
    "MOV Rn, direct"
  end

  def size
    2
  end

  def encoding
    ["10101nnn", "direct"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "mov R#{n}, #{direct8(opcodes[1])}"
  end
end
