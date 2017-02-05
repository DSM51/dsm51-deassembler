class ORL_A_immediate < Instruction
  def mnemonic
    "ORL A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01000100", "immediate"]
  end

  def format(pc, *opcodes)
    "orl A, #{immediate8(opcodes[1])}"
  end
end
