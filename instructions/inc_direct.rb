class INC_direct < Instruction
  def mnemonic
    "INC direct"
  end

  def size
    2
  end

  def encoding
    ["00000101", "direct"]
  end

  def format(pc, *opcodes)
    "inc #{direct8(opcodes[1])}"
  end
end
