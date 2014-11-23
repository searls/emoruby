require 'spec_helper'

require 'emoruby'

describe Emoruby do
  Given(:emo_source_with_stripped_puts) { emo_source.gsub(EmojiData.find_by_short_name("eyes").first.to_s, "") }

  context "a hello world app" do
    Given(:emo_source) { load_fixture("1_hello_world") }
    Given(:expected_ruby) { load_fixture("1_hello_world","rb") }

    describe 'translating source' do
      When(:result) { Emoruby.emoji_to_ruby(emo_source) }
      Then { result == expected_ruby }
    end

    describe 'evaluating source' do
      When(:result) { Emoruby.eval(emo_source_with_stripped_puts) }
      Then { Heart.new.wave == "smiley earth_asia" }
    end
  end

  context "a hello world app with a private method" do
    Given(:emo_source) { load_fixture("4_method_access") }
    Given(:expected_ruby) { load_fixture("4_method_access", "rb")}

    describe 'translating source' do
      When(:result) { Emoruby.emoji_to_ruby(emo_source) }
      Then { result == expected_ruby }
    end

    describe 'evaluating source' do
      When(:result) { Emoruby.eval(emo_source_with_stripped_puts) }
      Then { expect(Heart).to be_private_method_defined(:wave) }
      And { expect(Snowman).to be_public_method_defined(:lollipop) }
      And { expect(Snowman).to be_protected_method_defined(:floppy_disk) }
      And { expect(Snowman).to be_private_method_defined(:wave) }
    end
  end
end
