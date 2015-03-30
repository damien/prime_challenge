module Prime
  # Functional implementation of the Sieve of Eratosthenes
  #
  # Once initialized, an instance of this class may be used to generate an
  # infinite number of primes.
  #
  # @see https://www.cs.hmc.edu/~oneill/papers/Sieve-JFP.pdf
  # @see http://raganwald.com/2013/02/23/sieve.html
  class EratosthenesIncrementalSieve
    include Enumerable

    attr_reader :numbers
    attr_reader :composites

    def initialize
      @candidate_primes = {}
      @next_candidate = 2
      @candidate_primes[@next_candidate] = @next_candidate
    end

    # Find and return the next prime number
    def succ
      loop do
        @candidate_primes[@next_candidate] = @next_candidate
        new_prime = @next_candidate if sieve!
        @next_candidate += 1
        return new_prime if new_prime
      end
    end

    # Enumerate over all prime numbers returned by #succ
    def each
      return dup unless block_given?
      loop { yield succ }
    end

    private

    # Mark all candidate primes that are multiples of `number` as non-prime
    #
    # @return [Boolean] indicates if a prime number has been found given the
    #   current list of candidate primes
    def sieve!
      @candidate_primes
        .reject { |_, v| v == false } # Ignore preveiously sieved candidates
        .each do |n, _|
        # Don't factor past the square root of the current
        # candidate prime; we've already checked those factors
        break if n * n > @next_candidate

        @candidate_primes[@next_candidate] = false if @next_candidate % n == 0
      end

      @candidate_primes[@next_candidate] ? true : false
    end
  end
end
