RubyVM::InstructionSequence.compile_option = {
  :tailcall_optimization => true,
  :trace_instruction => false
}

RubyVM::InstructionSequence.new(<<-EOF).eval
def is_prime?(number)
  i = 2
  while i < number
    return false if number % i == 0
    i += 1
  end
  true
end

def prime_factors(number, i = 2, primes = [])
  if number % i == 0
    if primes.include?(i) || is_prime?(i)
      primes << i
      return primes if i == number
      prime_factors(number / i, i, primes)
    else
      prime_factors(number, i + 1, primes)
    end
  else
    prime_factors(number, i + 1, primes)
  end
end

# def prime_factors(number, i = 2, primes = [])
#   prime_factors(number, i + 1, primes) unless is_prime?(i)
#   if number % i == 0
#     primes << i
#     return primes if is_prime?(number)
#     prime_factors(number / i, i, primes)
#   else
#     prime_factors(number, i + 1, primes)
#   end
# end
EOF

# Driver Code Below
require 'benchmark'

input = ARGV.first.to_i
Benchmark.bm do |x|
  x.report { $response = prime_factors(input) }
end
puts
puts "returns this value: #{$response}"
