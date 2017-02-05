class MOV_bit_C < Instruction
  def mnemonic
    "MOV bit, C"
  end

  def size
    2
  end

  def encoding
    ["10010010", "bit"]
  end

  def format(pc, *opcodes)
    "mov #{bit8(opcodes[1])}, C"
  end
end
