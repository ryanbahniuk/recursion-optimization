def prime_factors(number)
  prime_numbers = [2, 3, 5, 7, 11, 13, 17]
  final_array = []

  until prime_numbers.include?(number)
    prime_numbers.each do |prime|
      if number % prime == 0
        final_array << prime
        number = number / prime
        break
      end
    end
  end
  final_array << number
end

# Driver Code Below
require 'benchmark'

input = ARGV.first.to_i
Benchmark.bm do |x|
  x.report { $response = prime_factors(input) }
end
puts
puts "returns this value: #{$response.inspect}"
