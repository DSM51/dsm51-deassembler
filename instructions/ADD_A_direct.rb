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

  def format(pc, *opcodes)
    "add A, #{direct8(opcodes[1])}"
  end

end
