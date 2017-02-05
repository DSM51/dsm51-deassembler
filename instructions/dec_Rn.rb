class DEC_Rn < Instruction
  def mnemonic
    "DEC Rn"
  end

  def size
    1
  end

  def encoding
    ["00011nnn"]
  end

  def format(pc, *opcodes)
    n = opcodes[0] & register_n_mask(encoding[0])
    "dec R#{n}"
  end
end
