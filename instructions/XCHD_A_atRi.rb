class XCHD_A_atRi < Instruction
  def mnemonic
    "XCHD A, @Ri"
  end

  def size
    1
  end

  def encoding
    ["1101011i"]
  end
end
