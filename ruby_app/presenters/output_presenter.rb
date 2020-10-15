# frozen_string_literal: true

class LogParser
  # It presents the expected output into a more human readable output
  class OutputPresenter
    def initialize(parsed_file)
      @parsed_file = parsed_file
    end

    def present
      raise NoMethodError, 'Children classes need tp implement the present method'
    end

    private

    attr_reader :parsed_file

    def output_sorted
      visited_pages.tally.sort_by { |_key, value| -value }.to_h
    end

    def visited_pages
      raise NoMethodError, 'Children classes need tp implement the visited_pages method'
    end
  end
end
