require_relative '../../../ruby_app/presenters/output_presenter.rb'

describe LogParser::OutputPresenter do
  subject(:output_presenter) {
    LogParser::OutputPresenter.new(parsed_file)
  }

  let(:parsed_file) {
    File.absolute_path('/spec/fixtures/webserver_fixture.log')
  }

  let(:presented_results) {
    [
      '/about/2 5 visits',
      '/contact 4 visits',
      '/index 3 visits'
    ]
  }

  it 'formats the file to a human readable output' do
    expect(output_presenter.present).to eql(presented_results)
  end
end