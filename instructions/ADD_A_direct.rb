class ADD_A_direct < Instruction
  def mnemonic
    "ADD A, direct"
  end

  def size
    2
  end

  def encoding
    ["00100101", "direct"]
  end
end
