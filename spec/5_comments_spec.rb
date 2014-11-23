require 'spec_helper'

require 'emoruby'

describe Emoruby do
  Given(:emo_source) { load_fixture("5_comments") }
  Given(:expected_ruby) { load_fixture("5_comments","rb") }
  When(:result) { Emoruby.emoji_to_ruby(emo_source) }
  Then { expect(result).to match_all_the_characters_of(expected_ruby) }
end
