# frozen_string_literal: true

require_relative '../../ruby_app/log_parser.rb'
require_relative '../../ruby_app/presenters/total_visits_output_presenter.rb'
require_relative '../../ruby_app/presenters/uniq_visits_output_presenter.rb'

describe LogParser do
  let(:log_parser) { LogParser.new(log_path, output_presenter) }
  let(:log_path) { 'spec/fixtures/webserver_fixture.log' }

  describe 'List of Web page visits' do
    subject(:parse_visits) { log_parser.parse }

    let(:output_presenter) do
      LogParser::TotalVisitsOutputPresenter
    end

    let(:ordered_visits) do
      [
        '/about/2 5 visits',
        '/contact 4 visits',
        '/index 3 visits'
      ]
    end

    it 'returns a list ordered from higher to lower' do
      expect(parse_visits).to eql(ordered_visits)
    end

    context 'Given file does not exist' do
      let(:log_path) { 'non/existing/file.log' }

      it 'raises FileMissingError' do
        expect { parse_visits }.to raise_error LogParser::FileMissingError
      end
    end
  end

  describe 'List of unique pages view' do
    subject(:parse_unique_visits) { log_parser.parse }

    let(:output_presenter) do
      LogParser::UniqVisitsOutputPresenter
    end

    let(:ordered_uniq_visits) do
      [
        '/about/2 4 uniq visits',
        '/contact 3 uniq visits',
        '/index 2 uniq visits'
      ]
    end

    it 'returns a unique list order from higher to lower' do
      expect(parse_unique_visits).to eql(ordered_uniq_visits)
    end

    context 'Given file does not exist' do
      let(:log_path) { 'non/existing/file.log' }

      it 'raises FileMissingError' do
        expect { parse_unique_visits }.to raise_error LogParser::FileMissingError
      end
    end
  end

  context 'Given no argument supplied' do
    let(:log_path) { nil }

    it 'raises an ArgumentError' do
      expect { LogParser.new }.to raise_error ArgumentError
    end
  end
end
