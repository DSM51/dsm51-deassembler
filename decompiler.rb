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
    responsibilities[address] = type
  end

  def responsibility(address)
    responsibilities[address] || :unknown
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

    checked = []

    while !entries.empty? do
      entry = entries.pop

      next if checked.include? entry
      next if !binary.space.include? entry

      checked << entry
      checked.uniq!

    #  print " | #{entry.hex(16)}: "

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

      # puts " | #{result}"

      instruction.jumps(entry, *opcodes).each do |jump|
        entries << jump
        # puts " |   jump #{jump.hex(16)}"
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
      print "#{address.hex(16)}"

    	value = binary.at(address)

      instruction = results[address]

      if instruction.nil?
        opcode = take(address, 1).first
        puts "\t#{opcode.hex(8)}\t(#{responsibility(address)})  '#{text8(opcode)}'"
        address += 1
      else
        opcodes = take(address, instruction.size)
        bytes = opcodes.map { |op| op.hex(8) }
        bytes << "  " while bytes.count < 3

      	puts "\t#{bytes.join(' ')}\t\t\t#{instruction.format(address, *opcodes)}"
        address += instruction.size
      end

      break if address > binary.last
    end
  end
end
