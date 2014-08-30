
def prime_factors(number)
  require 'prime'
  prime_numbers = Prime.first(1000)
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

def prime_factors_tail(number, i = 2, primes = [])
  if number % i == 0
    if primes.include?(i) || is_prime?(i)
      primes << i
      return primes if i == number
      prime_factors_tail(number / i, i, primes)
    else
      prime_factors_tail(number, i + 1, primes)
    end
  else
    prime_factors_tail(number, i + 1, primes)
  end
end
EOF

# Driver Code Below
require 'benchmark'

input = ARGV.first.to_i
Benchmark.bm do |x|
  x.report("no tail: ") { prime_factors(input) }
  x.report("w/ tail: ") { prime_factors_tail(input) }
end
