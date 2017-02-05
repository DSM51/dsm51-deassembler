class XRL_A_direct < Instruction
  def mnemonic
    "XRL A, direct"
  end

  def size
    2
  end

  def encoding
    ["01100101", "direct"]
  end

  def format(pc, *opcodes)
    "xrl A, #{direct8(opcodes[1])}"
  end
end
