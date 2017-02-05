class MOV_A_immediate < Instruction
  def mnemonic
    "MOV A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["01110100", "immediate"]
  end

  def format(pc, *opcodes)
    "mov A, #{immediate8(opcodes[1])}"
  end
end
