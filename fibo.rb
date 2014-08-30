def fibonacci_recursive(n)
	return 0 if n == 0
	return 1 if n == 1
	fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
end

# Driver Code Below
require 'benchmark'

input = ARGV.first.to_i
Benchmark.bm do |x|
	x.report { $response = fibonacci_recursive(input) }
end
puts
puts "returns this value: #{$response}"
