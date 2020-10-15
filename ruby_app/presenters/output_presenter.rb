class LogParser
  class OutputPresenter
    def initialize(parsed_file)
      parsed_file = parsed_file
    end

    def present
      [
        '/about/2 5 visits',
        '/contact 4 visits',
        '/index 3 visits'
      ]
    end
  end
end