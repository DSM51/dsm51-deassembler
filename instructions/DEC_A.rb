class DEC_A < Instruction
  def mnemonic
    "DEC A"
  end

  def size
    1
  end

  def encoding
    ["00010100"]
  end

  def format(pc, *opcodes)
    "dec A"
  end
end
