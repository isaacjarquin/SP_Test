# frozen_string_literal: true

require_relative '../../../ruby_app/presenters/output_presenter.rb'

describe LogParser::OutputPresenter do
  subject(:output_presenter) do
    LogParser::OutputPresenter.new(parsed_file)
  end

  let(:parsed_file) do
    File.readlines(file_path).each(&:rstrip!)
  end

  let(:file_path) do
    'spec/fixtures/webserver_fixture.log'
  end

  let(:presented_results) do
    [
      '/about/2 5 visits',
      '/contact 4 visits',
      '/index 3 visits'
    ]
  end

  it 'formats the file to a human readable output' do
    expect(output_presenter.present).to eql(presented_results)
  end
end
