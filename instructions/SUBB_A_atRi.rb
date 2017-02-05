class SUBB_A_atRi < Instruction
  def mnemonic
    "SUBB A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1001011i"]
  end
end
