require 'minitest/spec'
require 'minitest/autorun'
require 'stringio'
require 'yaml'

# A little module that contains some convinience helpers for testing primes
module TestHelper
  FIRST_1000_PRIMES = YAML.load_file(
    File.dirname(File.realpath(__FILE__)) + '/data/primes.yml'
  )

  # Capture STDOUT
  # @see http://stackoverflow.com/a/16507680/51947
  # @return [String] standard output stream
  def self.capture_stdout(&block)
    old = $stdout
    $stdout = fake = StringIO.new
    block.call
    fake.string
  ensure
    $stdout = old
  end
end
