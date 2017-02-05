class XRL_A_atRi < Instruction
  def mnemonic
    "XRL A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0110011i"]
  end
end
