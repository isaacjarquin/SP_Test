# frozen_string_literal: true

require_relative 'presenters/output_presenter.rb'

# This implement logic to parse the webserver.log
class LogParser
  class FileMissingError < StandardError; end

  def initialize(log_path, output_formatter)
    @log_path = log_path
    @output_formatter = output_formatter
  end

  def parse
    raise FileMissingError unless File.exist?(log_path)

    output_formatter.new(parsed_file).present
  end

  private

  attr_reader :log_path, :output_formatter

  def parsed_file
    File.readlines(log_path).each(&:rstrip!)
  end
end
