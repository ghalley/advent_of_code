def manual_not(int)
  string = int.to_s(2).rjust(16, '0')
  result = []

  string.each_char do |char|
    if char == '0'
      result << '1'
    else
      result << '0'
    end
  end
  result.join.to_i(2)
end

def parse_instruction(string)
  operation_list = ['AND', 'OR', 'LSHIFT', 'RSHIFT']
  array = string.split(' ')
  target_wire = array.last

  if array.first == 'NOT'
    operation = 'NOT'
    operand_1 = array[1]
    operand_2 = nil
  elsif !(array & operation_list).empty?
    operation = (array & operation_list).first
    operand_1 = array.first
    operand_2 = array[2]
  else
    operation = nil
    operand_1 = array.first
  end

  [operand_1, operation, operand_2, target_wire]
end

def build_circuit(instructions, target)
  wires = {}
  instructions_hash = {}

  instructions.each_line do |line|
    line_array = parse_instruction(line)
    instructions_hash[line_array.last] = {operand_1: line_array.first, operand_2: line_array[2], operation: line_array[1]}

    # initial values
    wires[line_array.last] = line_array[1].nil? && !(line_array.first.match(/[0-9]/).nil?) ? line_array.first : nil
  end

  while wires[target].nil?
    instructions_hash.keys.each do |i|
      check_instruction(i, wires, instructions_hash)
    end
  end

  puts wires[target]
end

def check_instruction(i, wires, instructions_hash)
  trans = {
    'AND'    => '&',
    'OR'     => '|',
    'LSHIFT' => '<<',
    'RSHIFT' => '>>'
  }
  # check for all operands having a value in wires.  if so, evaluate.
  if instructions_hash[i][:operation]
    operand_1 = instructions_hash[i][:operand_1]
    operand_2 = instructions_hash[i][:operand_2]

    if wires.keys.include? operand_1
      operand_1 = wires[operand_1]
    end

    if wires.keys.include? operand_2
      operand_2 = wires[operand_2]
    end

    if instructions_hash[i][:operation] == 'NOT'
      return if operand_1.nil?
      result = manual_not(operand_1.to_i)
    else
      return if operand_1.nil? || operand_2.nil?
      # puts "#{operand_1} #{trans[instructions_hash[i][:operation]]} #{operand_2}"
      result=eval "#{operand_1} #{trans[instructions_hash[i][:operation]]} #{operand_2}"
    end
    wires[i] =  result
  elsif wires[instructions_hash[i][:operand_1]]
    wires[i] = wires[instructions_hash[i][:operand_1]]
  end
end

samples = "x -> z
x AND y -> d
x OR y -> e
x LSHIFT 2 -> f
y RSHIFT 2 -> g
NOT x -> h
123 -> x
456 -> y
NOT y -> i"

build_circuit(samples, 'z')

instructions = File.read("inputs/day_07.txt")

build_circuit(instructions, 'a')
