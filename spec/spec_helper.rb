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
    actual.chars.each_with_index.all? do |char, index|
      expected[index] == char
    end
  end

  failure_message_for_should do |actual|
    [actual, expected].join("\n\ndid not equal\n\n")
  end
end
