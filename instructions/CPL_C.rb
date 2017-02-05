class CPL_C < Instruction
  def mnemonic
    "CPL C"
  end

  def size
    1
  end

  def encoding
    ["10110011"]
  end
end
