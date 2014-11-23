require 'rspec/given'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'pry'

require 'support/file_helpers'
RSpec.configure do |c|
  c.include FileHelpers
end

RSpec::Matchers.define :match_all_the_characters_of do |expected|
  match do |actual|
    actual.chars.each_with_index.all? do |c, i|
      expected[i] == c
    end
  end

  failure_message_for_should do |actual|
    actual.chars.each_with_index.reject { |c, i| expected[i] == c }.map do |c,i|
      "expected that character #{i} would be #{c} but was #{actual[i]} (near '#{actual[i-5..i+5]}')"
    end.join("\n")
  end
end
