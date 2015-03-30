module Prime
  # An imparitive implemenation of the Sieve of Eratosthenes:
  #
  # 1. Create a list of consecutive integers from 2 to `n`: (2, 3, ..., `n`)
  # 2. Initially, let `p` equal 2, the first prime number
  # 3. Starting from `p`, enumerate its multiples by counting to `n`
  #    in increments of `p`, and mark them in the list
  #    (these will be 2p, 3p, 4p, ... ; the `p` itself should not be marked)
  # 4. Find the first number greater than `p` in the list that is not marked.
  #    If there was no such number, stop.
  #    Otherwise, let `p` now equal this new number (which is the next prime),
  #    and repeat from step 3
  module EratosthenesSieve
    # Find all primes up to a given integer
    #
    # @param limit [Integer] The upper limit of prime numbers to compute
    def self.primes_upto(limit)
      numbers_to_sieve = 2..limit
      sieve = numbers_to_sieve.each_with_object({}) { |n, hash| hash[n] = true }

      numbers_to_sieve.each do |p|
        next unless sieve[p] # Skip `p` if we already know it is non-prime

        multiples = numbers_to_sieve
                    .select { |n| n % p == 0 } # Multiples of `p`
                    .drop(1) # Exclude `p` itself (the first multiple)

        # Flag all multiples of `p` as non-prime
        multiples.each { |multiple| sieve[multiple] = false }
      end

      sieve.select { |_, v| v }.keys
    end
  end
end
