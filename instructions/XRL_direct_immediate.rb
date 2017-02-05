class XRL_direct_immediate < Instruction
  def mnemonic
    "XRL direct, #immediate"
  end

  def size
    3
  end

  def encoding
    ["01100011", "direct", "immediate"]
  end

  def format(pc, *opcodes)
    "xrl #{direct8(opcodes[1])}, #{immediate8(opcodes[2])}"
  end
end
