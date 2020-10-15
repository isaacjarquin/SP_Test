describe LogParser do
  let(:log_parser) { LogParser.new(log_path) }

  describe 'List of Web page visits' do
    subject(:parse_visits) { log_parser.parse }

    let(:log_path) { 'spec/fixtures/webserver_fixture.log' }
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

    context 'Given no argument supplied' do
      let(:log_path) { nil }

      it 'raises an ArgumentError' do
        expect { LogParser.new }.to raise_error ArgumentError
      end
    end
  end
end
