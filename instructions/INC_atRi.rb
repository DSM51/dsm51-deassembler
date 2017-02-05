class INC_atRi < Instruction
  def mnemonic
    "INC @Ri"
  end

  def size
    1
  end

  def encoding
    ["0000011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "inc @R#{i}"
  end
end
