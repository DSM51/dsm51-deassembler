require 'awesome_print'

def normalize(content)
  content
    .split("\n")
    .select { |line| line.match(/^[0-9a-f]{4}: [0-9a-f]{2}$/) }
    .map { |line|  line.split(': ') }
end

def value(*values)
  freq = values.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  values.max_by { |v| freq[v] }
end


files = ARGV
          .map { |file| File.read(file) }
          .map { |content| Hash[normalize(content)] }

first = 0x8000
last = 0xefff

(first..last).each do |address|
  address = address.to_s(16)
  lines = files.map { |hash| hash[address] }

  puts "#{address}: #{value(*lines)}"
end
