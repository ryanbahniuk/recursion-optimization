def fibonacci_recursive(n, memo = {})
	return 0 if n == 0
	return 1 if n == 1
	if memo.has_key?(n)
		memo[n]
	else
		fibonacci = fibonacci_recursive(n - 1, memo) + fibonacci_recursive(n - 2, memo)
		memo[n] = fibonacci
	end
end

# Driver Code Below
require 'benchmark'

input = ARGV.first.to_i
Benchmark.bm do |x|
	x.report { $response = fibonacci_recursive(input) }
end
puts
puts "returns this value: #{$response}"
