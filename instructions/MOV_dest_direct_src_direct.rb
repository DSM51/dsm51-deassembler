class MOV_dest_direct_src_direct < Instruction
  def mnemonic
    "MOV dest_direct, src_direct"
  end

  def size
    3
  end

  def encoding
    ["10000101", "src_direct", "dest_direct"]
  end

  def format(pc, *opcodes)
    "mov #{direct8(opcodes[2])}, #{direct8(opcodes[1])}"
  end
end
