class SETB_C < Instruction
  def mnemonic
    "SETB C"
  end

  def size
    1
  end

  def encoding
    ["11010011"]
  end
end
