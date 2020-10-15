# frozen_string_literal: true

require_relative './total_visits_output_presenter.rb'

class LogParser
  # It presents the expected output into a more human readable output
  class OutputPresenter
    def initialize(parsed_file)
      @parsed_file = parsed_file
    end

    def present
      ::LogParser::TotalVisitsOutputPresenter.new(parsed_file).present
    end

    def present_unique_visits
      output_sorted_uniq_visits.map do |key, value|
        "#{key} #{value} uniq visits"
      end
    end

    private

    attr_reader :parsed_file

    def output_sorted_uniq_visits
      visited_pages_uniq_visits.tally.sort_by { |_key, value| -value }.to_h
    end

    def visited_pages_uniq_visits
      parsed_file.uniq.map do |line|
        line.split(' ')[0]
      end
    end
  end
end
