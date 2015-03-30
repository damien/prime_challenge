require 'spec_helper'
require 'cli'

describe CLI do
  describe 'when provided no arguments' do
    before do
      @cli = CLI.new([])
    end

    it 'should print a multiplication table for the first 10 primes' do
      output = TestHelper.capture_stdout do
        @cli.run!
      end

      expected = <<-EOL
            2   3   5   7  11  13  17  19  23  29
        2   4   6  10  14  22  26  34  38  46  58
        3   6   9  15  21  33  39  51  57  69  87
        5  10  15  25  35  55  65  85  95 115 145
        7  14  21  35  49  77  91 119 133 161 203
        11  22  33  55  77 121 143 187 209 253 319
        13  26  39  65  91 143 169 221 247 299 377
        17  34  51  85 119 187 221 289 323 391 493
        19  38  57  95 133 209 247 323 361 437 551
        23  46  69 115 161 253 299 391 437 529 667
        29  58  87 145 203 319 377 493 551 667 841
      EOL

      cleaned_output = output.split("\n").map(&:strip).join("\n")
      cleaned_expected = expected.split("\n").map(&:strip).join("\n")
      cleaned_output.must_include(cleaned_expected)
    end
  end

  describe 'when provided a numeric argument' do
    before do
      @cli = CLI.new([5])
    end

    it 'will create a product table with as many cols/rows as specified' do
      output = TestHelper.capture_stdout do
        @cli.run!
      end

      expected = <<-EOL
              2   3   5   7  11
          2   4   6  10  14  22
          3   6   9  15  21  33
          5  10  15  25  35  55
          7  14  21  35  49  77
         11  22  33  55  77 121
      EOL

      cleaned_output = output.split("\n").map(&:strip).join("\n")
      cleaned_expected = expected.split("\n").map(&:strip).join("\n")
      cleaned_output.must_include(cleaned_expected)
    end
  end

  describe 'when passed "-h" or "--help"' do
    it 'should print usage instructions' do
      cli_h = CLI.new(['-h'])
      cli_help = CLI.new(['--help'])

      output_h = TestHelper.capture_stdout do
        cli_h.run!
      end

      output_help = TestHelper.capture_stdout do
        cli_help.run!
      end

      output_h.must_equal("Usage: prime_challenge [10]\n")
      output_help.must_equal("Usage: prime_challenge [10]\n")
    end
  end
end
