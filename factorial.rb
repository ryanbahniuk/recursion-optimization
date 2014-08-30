def factorial_recursive(n)
	return 1 if n == 0
	n * factorial_recursive(n - 1)
end


# Driver Code Below
require 'benchmark'

input = ARGV.first.to_i
Benchmark.bm do |x|
	x.report { $response = factorial_recursive(input) }
end
puts
puts "returns this value: #{$response}"
