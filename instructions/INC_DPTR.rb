class INC_DPTR < Instruction
  def mnemonic
    "INC DPTR"
  end

  def size
    1
  end

  def encoding
    ["10100011"]
  end

  def format(pc, *opcodes)
    "inc DPTR"
  end
end
