class ADD_A_immediate < Instruction
  def mnemonic
    "ADD A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["00100100", "immediate"]
  end
end
