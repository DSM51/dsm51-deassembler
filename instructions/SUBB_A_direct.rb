class SUBB_A_direct < Instruction
  def mnemonic
    "SUBB A, direct"
  end

  def size
    2
  end

  def encoding
    ["10010101", "direct"]
  end

  def format(pc, *opcodes)
    "subb A, #{direct8(opcodes[1])}"
  end
end
