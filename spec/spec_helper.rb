require 'rspec/given'
require 'support/file_helpers'

RSpec::Matchers.define :match_all_the_characters_of do |expected|
  match do |actual|
    expected.chars.each_with_index.all? do |c, i|
      actual[i] == c
    end
  end

  failure_message_for_should do |actual|
    expected.chars.each_with_index.reject { |c, i| actual[i] == c }.map do |c,i|
      "expected that character #{i} would be #{c} but was #{actual[i]} (near '#{actual[i-5..i+5]}')"
    end.join("\n")
  end
end

RSpec.configure do |c|
  c.include FileHelpers
end

# other junk
require 'pry'
