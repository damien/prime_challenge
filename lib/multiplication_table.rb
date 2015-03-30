# MultiplicationTable is a class that generates a table of products for each
# row/column heading pair.
#
# Example:
#
#   puts MultiplicationTable.new(columns: [1, 2, 3], rows: [2, 4, 6])
#
# Would print the following in STDOUT:
#
#      1  2  3
#   2  2  4  6
#   4  4  8 12
#   6  6 12 18
#
class MultiplicationTable
  attr_reader :columns
  attr_reader :rows

  def initialize(columns: [], rows: [])
    @columns = columns
    @rows = rows
    @factors = []
    generate_table!
  end

  def to_s
    output = []
    format_string = "%#{maximum_width}s " * (@columns.size + 1)

    @factors.each do |data|
      output << format(format_string, *data)
    end

    output.join("\n")
  end

  private

  def generate_table!
    # Table headings
    @factors << [nil, *@columns]

    # Followed by the column heading and column/row products
    @rows.each do |row|
      data = @columns.map { |column| column * row }
      data.unshift(row) # prepend products with column heading
      @factors << data
    end
  end

  # Determine the size of the longest row, column, or product value represented
  # as a string
  def maximum_width
    @factors.flatten.reject(&:nil?).max.to_s.size
  end
end
