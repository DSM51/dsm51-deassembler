class ORL_direct_immediate < Instruction
  def mnemonic
    "ORL direct, #immediate"
  end

  def size
    3
  end

  def encoding
    ["01000011", "direct", "immediate"]
  end

  def format(pc, *opcodes)
    "orl #{direct8(opcodes[1])}, #{immediate8(opcodes[2])}"
  end
end
