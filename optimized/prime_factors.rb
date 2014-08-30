#Run this in the command line from your root folder like this:
#=> $ ruby optimized/run_with_tco.rb optimized/prime_factors.rb

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

p prime_factors(8)
