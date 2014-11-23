require 'rspec/given'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'pry'

require 'support/file_helpers'
RSpec.configure do |c|
  c.include FileHelpers
end
