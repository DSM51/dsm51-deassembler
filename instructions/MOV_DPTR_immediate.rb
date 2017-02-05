class MOV_DPTR_immediate < Instruction
  def mnemonic
    "MOV DPTR, #immediate"
  end

  def size
    3
  end

  def encoding
    ["10010000", "immediate[15-8]", "immediate[7-0]"]
  end
end
