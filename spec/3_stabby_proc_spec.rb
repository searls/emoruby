require "spec_helper"

require "emoruby"

describe Emoruby do
  Given(:source) { load_fixture("3_stabby_proc") }
  When(:result) { Emoruby.eval(source) }
  Then { result == "smiley" }
end
