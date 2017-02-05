class MOVX_atDPTR_A < Instruction
  def mnemonic
    "MOVX @DPTR, A"
  end

  def size
    1
  end

  def encoding
    ["11110000"]
  end

  def format(pc, *opcodes)
    "movx @DPTR, A"
  end
end
