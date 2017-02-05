class RR_A < Instruction
  def mnemonic
    "RR A"
  end

  def size
    1
  end

  def encoding
    ["00000011"]
  end

  def format(pc, *opcodes)
    "rr A"
  end
end
