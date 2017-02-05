class Binary
  attr_reader :first, :last, :content

  def initialize(content, options = {})
    @first = options[:first] || fail
    @last = options[:last] || fail
    @content = content
  end

  def at(position)
    content[position] || 0x00
  end

  def space
    first..last
  end

end
