class XRL_A_immediate < Instruction
  def mnemonic
    "XRL A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01100100", "immediate"]
  end

  def format(pc, *opcodes)
    "xrl A, #{immediate8(opcodes[1])}"
  end
end
