class NOP < Instruction
  def mnemonic
    "NOP"
  end

  def size
    1
  end

  def encoding
    ["00000000"]
  end

  def format(pc, *opcodes)
    "nop"
  end
end
