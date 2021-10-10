require "rspec/given"

require "pry"

require "support/file_helpers"
RSpec.configure do |c|
  c.include FileHelpers
end
