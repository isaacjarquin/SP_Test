# frozen_string_literal: true

# This implement logic to parse the webserver.log
class LogParser
  class FileMissingError < StandardError; end

  def initialize(log_path)
    @log_path = log_path
  end

  def parse
    raise FileMissingError unless File.exist?(log_path)
  end

  private

  attr_reader :log_path
end
