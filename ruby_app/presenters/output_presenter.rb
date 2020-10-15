# frozen_string_literal: true

require_relative './total_visits_output_presenter.rb'
require_relative './uniq_visits_output_presenter.rb'

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
      ::LogParser::UniqVisitsOutputPresenter.new(parsed_file).present
    end

    private

    attr_reader :parsed_file
  end
end
