require 'yaml'
require 'awesome_print'


instructions = YAML.load_file('instructions.yml')

# ap instructions


instructions.each do |instruction|
  name = instruction[:instruction]
  size = instruction[:bytes]
  encoding = instruction[:encoding]

  klass = name
            .gsub('@', 'at')
            .gsub('/', 'not')
            .gsub('#', '_')
            .gsub(' ', '_')
            .gsub(',', '_')
            .gsub('+', '_')
            .gsub('__', '_')
            .gsub('__', '_')

  template = <<-TEMPLATE
class #{klass} < Instruction
  def mnemonic
    "#{name}"
  end

  def size
    #{size}
  end

  def encoding
    #{encoding}
  end
end
  TEMPLATE

  File.write "instructions/#{klass}.rb", template
end
