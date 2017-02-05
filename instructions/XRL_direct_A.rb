class XRL_direct_A < Instruction
  def mnemonic
    "XRL direct, A"
  end

  def size
    2
  end

  def encoding
    ["01100010", "direct"]
  end

  def format(pc, *opcodes)
    "xrl #{direct8(opcodes[1])}, A"
  end
end
