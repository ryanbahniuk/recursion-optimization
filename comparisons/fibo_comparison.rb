def fibonacci_recursive(n)
	return 0 if n == 0
	return 1 if n == 1
	fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
end

def fibonacci_recursive_memo(n, memo = {})
	return 0 if n == 0
	return 1 if n == 1
	if memo.has_key?(n)
		memo[n]
	else
		fibonacci = fibonacci_recursive_memo(n - 1, memo) + fibonacci_recursive_memo(n - 2, memo)
		memo[n] = fibonacci
	end
end

# Driver Code Below
require 'benchmark'

input = ARGV.first.to_i
Benchmark.bm do |x|
	x.report("no memo: ") { fibonacci_recursive(input) }
	x.report("w/ memo: ") { fibonacci_recursive_memo(input) }
end
