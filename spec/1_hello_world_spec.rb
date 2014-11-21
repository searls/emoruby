require 'spec_helper'

require 'emoruby'

describe Emoruby do
  Given(:file_name) { "1-hello-world" }
  Given(:emo_path) { Pathname.pwd.join("spec","fixtures","#{file_name}.emoruby") }
  Given(:expected_ruby_path) { Pathname.pwd.join("spec","fixtures","#{file_name}.rb") }
  Given(:source) { File.read(emo_path) }
  When(:result) { Emoruby.translate(source) }

  Given(:expected) { File.read(expected_ruby_path) }
  Then { expect(result).to match_all_the_characters_of(expected) }
end
