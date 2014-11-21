require 'spec_helper'

require 'emoruby'

describe Emoruby do
  Given(:emo_path) { Pathname.pwd.join("spec","fixtures","#{file_name}.emoruby") }
  Given(:emo_source) { File.read(emo_path) }
  Given(:expected_ruby_path) { Pathname.pwd.join("spec","fixtures","#{file_name}.rb") }
  Given(:expected_ruby) { File.read(expected_ruby_path) }

  context "a hello world app" do
    Given(:file_name) { "1-hello-world" }

    describe 'translating source' do
      When(:result) { Emoruby.emoji_to_ruby(emo_source) }
      Then { expect(result).to match_all_the_characters_of(expected_ruby) }
    end

    describe 'evaluating source' do
      Given(:source_with_stripped_puts) { emo_source.gsub(EmojiData.find_by_short_name("eyes").first.to_s, "") }
      When(:result) { Emoruby.eval(source_with_stripped_puts) }
      Then { Heart.new.wave == "smiley earth_asia" }
    end
  end
end
