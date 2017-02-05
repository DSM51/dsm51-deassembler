class MOVC_A_atA_PC < Instruction
  def mnemonic
    "MOVC A, @A+PC"
  end

  def size
    1
  end

  def encoding
    ["10000011"]
  end

  def format(pc, *opcodes)
    "movc A, @A+PC"
  end
end
