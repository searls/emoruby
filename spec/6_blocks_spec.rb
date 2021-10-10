require "spec_helper"

require "emoruby"

describe Emoruby do
  Given(:source) { load_fixture("6_blocks") }
  When(:result) { Emoruby.eval(source) }
  Then { result == [10, 4] }
end
