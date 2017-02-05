class ADDC_A_immediate < Instruction
  def mnemonic
    "ADDC A, #immediate"
  end

  def size
    2
  end

  def encoding
    ["00110100", "immediate"]
  end

  def format(pc, *opcodes)
    "addc A, #{immediate8(opcodes[1])}"
  end
end
