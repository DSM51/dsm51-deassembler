class ADDC_A_atRi < Instruction
  def mnemonic
    "ADDC A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0011011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "addc A, @R#{i}"
  end
end
