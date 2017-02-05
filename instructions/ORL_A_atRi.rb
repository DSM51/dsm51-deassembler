class ORL_A_atRi < Instruction
  def mnemonic
    "ORL A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0100011i"]
  end
end
