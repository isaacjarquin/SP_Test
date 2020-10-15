# SP_Test

## Design considerations
I have used TDD along the completion of this test. I firstly focused on the Total Visits Functionality, writing some integration test to cover the 3 main cases:
  - User pass no argument
  - User pass a log_path file that does not exist on local
  - success case for total visits
While building the functionality to pass the integration test, a new unit test were built along the preccess.

Once the first part was done I wrote similar integration test for the Uniq visits functionality and and right after that I jumped into building the uniq visits funcionality, as this part share quite alot of code with the previous (Total views), the developemnt was faster. For this second part I decided to go along duplicating code when necessary so I could just focus on the functionality itself.

Once both finctionalities were finished I started to refactor the code to remove duplication. Going along with this proccess I relaized that If inyected the Presenters I could create a Base clase to move all the duplicated code and let the children implement the especific details.

## Tools

I added the following tools to help with developemnt:
  - Rspec: To write integration and unit test
  - Rubocop: To help with the sintax
  - simplecov: To helt with test coverage.
  - pry: to help with debugging.

## Intructions to run the app locally

- open the console
  irb

- load all require files

```
require_relative "ruby_app/log_parser.rb"
require_relative "ruby_app/presenters/total_visits_output_presenter.rb"
require_relative "ruby_app/presenters/uniq_visits_output_presenter.rb"
```

to get the total views result:

``` LogParser.new("ruby_app/webserver.log", LogParser::TotalVisitsOutputPresenter) ```

this should output

```
[
  "/about/2 90 visits",
  "/contact 89 visits",
  "/index 82 visits",
  "/about 81 visits",
  "/help_page/1 80 visits",
  "/home 78 visits"
]
```

to get the uniq views result:

``` LogParser.new("ruby_app/webserver.log", LogParser::UniqVisitsOutputPresenter) ```

this should output:

```
[
  "/help_page/1 23 uniq visits",
  "/contact 23 uniq visits",
  "/home 23 uniq visits",
  "/index 23 uniq visits",
  "/about/2 22 uniq visits",
  "/about 21 uniq visits"
]
```
