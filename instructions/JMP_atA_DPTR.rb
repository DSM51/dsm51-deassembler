class JMP_atA_DPTR < Instruction
  def mnemonic
    "JMP @A + DPTR"
  end

  def size
    1
  end

  def encoding
    ["01110011"]
  end

  def format(pc, *opcodes)
    puts "jmp @A+DPTR"
  end
end
