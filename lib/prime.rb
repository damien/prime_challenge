# The Prime module contains classes for generating prime numbers.
#
# The particular implementation of Prime uses the Sieve of Eratosthenes to
# generate as many primes as required. Operations for generating `n` primes
# using the original implementation are `O(n log(log(n)))` in complexity.
#
# This module includes two strategies for generating primes:
#
#   * Finding all primes up to a given integer or limit:
#     faster, but the number of primes returned will be variable
#   * Generating primes iteratively:
#     slower, but will guarentee a set number of primes is generated
#
# @see http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
module Prime
  autoload :EratosthenesSieve, 'prime/eratosthenes_sieve'
  autoload :EratosthenesIncrementalSieve, 'prime/eratosthenes_incremental_sieve'
end
