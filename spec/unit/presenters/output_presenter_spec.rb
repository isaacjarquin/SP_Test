# frozen_string_literal: true

require_relative '../../../ruby_app/presenters/output_presenter.rb'

class ChildrenClass < LogParser::OutputPresenter
  def visited_pages
    'dummy output'
  end
end

class ChildrenWithNoVisitedPagesImplemented < LogParser::OutputPresenter
  def present
    output_sorted.map do |key, value|
      "#{key} #{value} visits"
    end
  end
end


describe LogParser::OutputPresenter do
  let(:parsed_file) do
    File.readlines(file_path).each(&:rstrip!)
  end

  let(:file_path) do
    'spec/fixtures/webserver_fixture.log'
  end

  context 'Given children does not implement present method' do
    let(:children_with_no_present_implemented) {
      ChildrenClass.new(parsed_file)
    }

    it 'raises a NoMethodError' do
      expect {
        children_with_no_present_implemented.present
      }.to raise_error NoMethodError, 'Children classes need to implement the present method'
    end
  end

  context 'Given children does not implement visit_pages method' do
    let(:children_with_no_visited_pages_implemented) {
      ChildrenWithNoVisitedPagesImplemented.new(parsed_file)
    }

    it 'raises a NoMethodError' do
      expect {
        children_with_no_visited_pages_implemented.present
      }.to raise_error NoMethodError, 'Children classes need to implement the visited_pages method'
    end
  end
end