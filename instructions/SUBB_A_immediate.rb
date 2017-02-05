class SUBB_A_immediate < Instruction
  def mnemonic
    "SUBB A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["10010100", "immediate"]
  end

  def format(pc, *opcodes)
    "subb A, #{immediate8(opcodes[1])}"
  end
end
