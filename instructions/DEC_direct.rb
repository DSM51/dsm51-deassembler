class DEC_direct < Instruction
  def mnemonic
    "DEC direct"
  end

  def size
    2
  end

  def encoding
    ["00010101", "direct"]
  end

  def format(pc, *opcodes)
    "dec #{direct8(opcodes[1])}"
  end
end
