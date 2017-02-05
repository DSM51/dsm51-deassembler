class RL_A < Instruction
  def mnemonic
    "RL A"
  end

  def size
    1
  end

  def encoding
    ["00100011"]
  end
end
