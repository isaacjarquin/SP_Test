# frozen_string_literal: true

require_relative 'output_presenter.rb'

class LogParser
  # It presents the expected output into a more human readable output
  class TotalVisitsOutputPresenter < OutputPresenter
    def present
      output_sorted.map do |key, value|
        "#{key} #{value} visits"
      end
    end

    private

    def visited_pages
      parsed_file.map do |line|
        line.split(' ')[0]
      end
    end
  end
end
