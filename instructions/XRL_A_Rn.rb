class XRL_A_Rn < Instruction
  def mnemonic
    "XRL A, Rn"
  end

  def size
    1
  end

  def encoding
    ["01101nnn"]
  end
end
