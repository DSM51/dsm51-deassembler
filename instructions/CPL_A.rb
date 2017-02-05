class CPL_A < Instruction
  def mnemonic
    "CPL A"
  end

  def size
    1
  end

  def encoding
    ["11110100"]
  end
end
