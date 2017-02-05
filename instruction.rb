class Instruction
  PARAMETERS = [
    'immediate',
    'direct',
    'bit',
    'offset',
    'addr[15-8]',
    'addr[7-0]',
    'dest_direct',
    'src_direct',
    'immediate[15-8]',
    'immediate[7-0]'
  ].freeze

  def self.inherited(klass)
		@all ||= []
		@all << klass
	end

  def self.all
    @all || []
  end

  def check(*opcodes)
    return false if opcodes.count != size

    valid = opcodes.map(&:bin).zip(encoding).map do |opcode, encoding|
      if is_byte_parametrized?(encoding)
        true
      elsif is_byte_registry?(encoding)
        match_encoding(encoding, opcode)
      else
        opcode == encoding
      end
    end

    valid.all?
  end

  def format(pc, *opcodes)
    index = 0

    chunks.map do |chunk|
      value = opcodes[index]
      index += 1

      case chunk
      when 'addr16' then direct16(value, opcodes[index])
      when 'direct' then direct8(value)
      when '#immediate' then immediate8(value)
      when 'bit' then bit8(value)
      when 'Rn'
        index -= 1
        n = opcodes[0] & register_n_mask(encoding[0])
        "R#{n}"
      when ','
        index -= 1
        ','
      else chunk
      end
    end.join(' ').gsub(' ,', ',')
  end

  def jumps(pc, *opcodes)
    [pc + size]
  end

  protected

  def register_n_mask(encoding)
    encoding.gsub('0','_').gsub('1','_').gsub('n','1').gsub('_','0').to_i(2)
  end

  def register_i_mask(encoding)
    encoding.gsub('0','_').gsub('1','_').gsub('i','1').gsub('_','0').to_i(2)
  end

  def chunks
    mnemonic.gsub(',', ' ,').split(' ')
  end

  def match_encoding(encoding, opcode)
    encoding.each_char.zip(opcode.each_char).map do |e, o|
      if ['i', 'n'].include? e
        true
      else
        e == o
      end
    end.all?
  end

  def is_byte_parametrized?(string)
    PARAMETERS.include?(string)
  end

  def is_byte_registry?(string)
    ["01n", "01i"].include? string.each_char.to_a.uniq.sort.join
  end
end
