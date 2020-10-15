# frozen_string_literal: true

require_relative 'output_presenter.rb'

class LogParser
  # It presents the expected output into a more human readable output
  class UniqVisitsOutputPresenter < OutputPresenter
    def present
      output_sorted.map do |key, value|
        "#{key} #{value} uniq visits"
      end
    end

    private

    def visited_pages
      parsed_file.uniq.map do |line|
        line.split(' ')[0]
      end
    end
  end
end
