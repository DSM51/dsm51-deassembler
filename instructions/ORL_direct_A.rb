class ORL_direct_A < Instruction
  def mnemonic
    "ORL direct, A"
  end

  def size
    2
  end

  def encoding
    ["01000010", "direct"]
  end

  def format(pc, *opcodes)
    "orl #{direct8(opcodes[1])}, A"
  end
end
