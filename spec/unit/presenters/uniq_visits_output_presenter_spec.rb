# frozen_string_literal: true

require_relative '../../../ruby_app/presenters/uniq_visits_output_presenter.rb'

describe LogParser::UniqVisitsOutputPresenter do
  subject(:output_presenter) do
    LogParser::UniqVisitsOutputPresenter.new(parsed_file)
  end

  describe 'total uniq visited' do
    let(:parsed_file) do
      File.readlines(file_path).each(&:rstrip!)
    end

    let(:file_path) do
      'spec/fixtures/webserver_fixture.log'
    end

    let(:presented_results) do
      [
        '/about/2 4 uniq visits',
        '/contact 3 uniq visits',
        '/index 2 uniq visits'
      ]
    end

    it 'formats the file to a human readable output' do
      expect(output_presenter.present).to eql(presented_results)
    end
  end
end
