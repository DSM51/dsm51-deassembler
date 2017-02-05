class ORL_A_Rn < Instruction
  def mnemonic
    "ORL A, Rn"
  end

  def size
    1
  end

  def encoding
    ["01001nnn"]
  end
end
