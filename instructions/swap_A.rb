class SWAP_A < Instruction
  def mnemonic
    "SWAP A"
  end

  def size
    1
  end

  def encoding
    ["11000100"]
  end

  def format(pc, *opcodes)
    "swap A"
  end
end
