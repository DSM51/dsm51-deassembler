class MOV_A_direct < Instruction
  def mnemonic
    "MOV A, direct"
  end

  def size
    2
  end

  def encoding
    ["11100101", "direct"]
  end

  def format(pc, *opcodes)
    "mov A, #{direct8(opcodes[1])}"
  end

end
