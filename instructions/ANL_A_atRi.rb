class ANL_A_atRi < Instruction
  def mnemonic
    "ANL A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["0101011i"]
  end
end
