require_relative 'array_solver'

solver = ArraySolver.new
array = ARGV.map { |element| element.to_i }

if array.length != 3
  puts "Invalid input. Try again"
  return
end

puts solver.solve_array(array)