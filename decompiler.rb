class Decompiler
  attr_reader :instructions, :binary, :entries

  def initialize(instructions, binary, options={})
    @instructions, @binary = instructions, binary
    @entries = options[:entries] || [0x0000]
  end

  def responsibilities
    @responsibilities ||= {}
  end

  def set_responsibility(address, type)
    responsibilities[address] ||= []
    responsibilities[address] << type unless responsibilities[address].include? type
  end

  def unknown?(address)
    (responsibilities[address] || []).empty?
  end

  def type?(address, type)
    (responsibilities[address] || []).include? type
  end

  def code?(address)
    type? address, :code
  end

  def jump?(address)
    type? address, :jump
  end


  def results
    @results ||= {}
  end

  def checked
    @checked ||= []
  end

  def run
    puts " * start"
    puts " -> entries: #{entries.map { |e| e.hex(16) }}"

    entries.each do |entry|
      set_responsibility(entry, :code)
      set_responsibility(entry, :jump)
    end

    checked = []

    while !entries.empty? do
      entry = entries.pop

      next if checked.include? entry
      next if !binary.space.include? entry

      checked << entry
      checked.uniq!

      possible = find(entry)

      if possible.count != 1
        ap possible
        puts " | dont know (#{possible.count}) at #{entry.hex(16)} for #{take(entry,3).map{|x|x.hex(8)}}"
        break
      end

      instruction = possible.first
      opcodes = take(entry, instruction.size)
      result = instruction.format(entry, *opcodes)

      results[entry] = instruction

      instruction.size.times.each do |offset|
        set_responsibility(entry+offset, :code)
      end

      instruction.jumps(entry, *opcodes).each do |jump|
        entries << jump
        set_responsibility(jump, :jump) unless jump == entry+instruction.size
      end
    end
  end

  def find(entry)
    instructions.select { |instruction|
      opcodes = take(entry, instruction.size)
      instruction.check(*opcodes)
    }
  end

  def take(entry, size)
    size.times.map { |i| binary.at(entry+i) }
  end

  def code
    address = binary.first

    loop do
    	value = binary.at(address)

      if unknown? address
        puts "#{address.hex(16)}\t    \t#{value.hex(8)}\t\t\t'#{text8(value)}'"
        address += 1
      elsif code? address
        instruction = results[address]
        opcodes = take(address, instruction.size)

        bytes = opcodes.map { |op| op.hex(8) }
        bytes << "  " while bytes.count < 3

        puts "#{address.hex(16)}\t(#{jump?(address)?"jump":"code"})\t#{bytes.join(' ')}\t\t#{instruction.format(address, *opcodes)}"
        address += instruction.size
      else
        puts "#{address.hex(16)}\t#{value.hex(8)}\t(wtf)"
        address += 1
      end


      # if instruction.nil?
      #   opcode = take(address, 1).first
      #
      #
      # else
      #
      #
      #
      #
      # end

      break if address > binary.last
    end
  end
end
