class MOV_direct_immediate < Instruction
  def mnemonic
    "MOV direct, #immediate"
  end

  def size
    3
  end

  def encoding
    ["01110101", "direct", "immediate"]
  end

  def format(pc, *opcodes)
    "mov #{direct8(opcodes[1])}, #{immediate8(opcodes[2])}"
  end
end
