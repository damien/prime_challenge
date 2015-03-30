require 'spec_helper'
require 'prime'

describe Prime::EratosthenesSieve do
  it 'correctly generates the first 1,000 known primes' do
    Prime::EratosthenesSieve.primes_upto(TestHelper::FIRST_1000_PRIMES.last)
      .must_equal(TestHelper::FIRST_1000_PRIMES)
  end
end
