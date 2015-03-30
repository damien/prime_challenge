require 'multiplication_table'
require 'prime'

# Command line interface for this prime challenge
class CLI
  attr_reader :options
  attr_reader :argv

  def initialize(argv)
    @argv = argv
    @options = {
      number: 10
    }

    number = argv.first
    @options[:number] = number.to_i if number && !number.to_i.nil?
  end

  def run!
    case @argv.first
    when '-h', '--help'
      puts 'Usage: prime_challenge [10]'
      return
    end

    sieve = Prime::EratosthenesIncrementalSieve.new
    primes = sieve.take(@options[:number])
    puts MultiplicationTable.new(columns: primes, rows: primes)
  end
end
