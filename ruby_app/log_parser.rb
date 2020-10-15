# frozen_string_literal: true

require_relative 'presenters/output_presenter.rb'

# This implement logic to parse the webserver.log
class LogParser
  class FileMissingError < StandardError; end

  def initialize(log_path)
    @log_path = log_path
  end

  def parse
    raise FileMissingError unless File.exist?(log_path)

    OutputPresenter.new().present
  end

  private

  attr_reader :log_path
end
