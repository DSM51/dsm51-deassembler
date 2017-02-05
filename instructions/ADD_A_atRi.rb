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
end
