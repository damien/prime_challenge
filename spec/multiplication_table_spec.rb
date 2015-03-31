require 'spec_helper'
require 'multiplication_table'

describe MultiplicationTable do
  describe '#initialize' do
    it 'should accept a variable number of columns and rows' do
      mt = MultiplicationTable.new(columns: [1, 2], rows: [3, 4])
      mt.columns.must_equal [1, 2]
      mt.rows.must_equal [3, 4]
    end
  end

  describe '#to_s' do
    it 'should return a string representation of the product table' do
      # Tables of equal height/width
      mt1 = MultiplicationTable.new(columns: [2, 4], rows: [3, 9])
      mt1.to_s.must_equal("    2  4 \n 3  6 12 \n 9 18 36 ")

      # Tables that are tall
      mt2 = MultiplicationTable.new(columns: [3, 6, 9], rows: [1, 3, 4, 6])
      mt2.to_s.must_equal(
        "    3  6  9 \n 1  3  6  9 \n 3  9 18 27 \n 4 12 24 36 \n 6 18 36 54 "
      )

      # Tables that are wide
      mt3 = MultiplicationTable.new(columns: [1, 3, 5, 7], rows: [7, 13])
      mt3.to_s.must_equal("    1  3  5  7 \n 7  7 21 35 49 \n13 13 39 65 91 ")
    end
  end
end
