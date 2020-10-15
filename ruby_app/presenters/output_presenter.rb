
class LogParser
  class OutputPresenter
    def initialize(parsed_file)
      @parsed_file = parsed_file
    end

    def present
      output_sorted.map do |key, value|
        "#{key} #{value} visits"
      end
    end

    private

    attr_reader :parsed_file

    def output_sorted
      visited_pages.tally.sort_by { |_key, value| -value }.to_h
    end

    def visited_pages
      parsed_file.map do |line|
        line.split(' ')[0]
      end
    end
  end
end