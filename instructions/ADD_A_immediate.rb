class ADD_A_immediate < Instruction
  def mnemonic
    "ADD A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["00100100", "immediate"]
  end

  def format(pc, *opcodes)
    "add A, #{immediate8(opcodes[1])}"
  end
end
