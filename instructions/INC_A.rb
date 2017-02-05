class INC_A < Instruction
  def mnemonic
    "INC A"
  end

  def size
    1
  end

  def encoding
    ["00000100"]
  end
end
