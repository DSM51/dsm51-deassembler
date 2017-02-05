class CJNE_atRn_immediate_offset < Instruction
  def mnemonic
    "CJNE @Rn, #immediate, offset"
  end

  def size
    3
  end

  def encoding
    ["1011011n", "immediate", "offset"]
  end
end
