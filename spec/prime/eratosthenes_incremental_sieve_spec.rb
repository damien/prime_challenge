require 'spec_helper'
require 'prime'

describe Prime::EratosthenesIncrementalSieve do
  before do
    @sieve = Prime::EratosthenesIncrementalSieve.new
  end

  it 'correctly generates the first 1,000 known primes' do
    @sieve.take(1000).must_equal(TestHelper::FIRST_1000_PRIMES)
  end

  describe 'behaves like an enumerable object' do
    it 'responds to #take' do
      @sieve.take(10).must_equal(TestHelper::FIRST_1000_PRIMES.take(10))
    end

    it 'may be iterated upon' do
      enum = @sieve.each
      enum.succ.must_equal(TestHelper::FIRST_1000_PRIMES[0])
      enum.succ.must_equal(TestHelper::FIRST_1000_PRIMES[1])
      enum.succ.must_equal(TestHelper::FIRST_1000_PRIMES[2])
    end
  end
end
