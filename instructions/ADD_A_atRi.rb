class ADD_A_atRi < Instruction
  def mnemonic
    "ADD A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0010011i"]
  end

  def format(pc, *opcodes)
    i = opcodes[0] & register_i_mask(encoding[0])
    "add A, @R#{i}"
  end

end
