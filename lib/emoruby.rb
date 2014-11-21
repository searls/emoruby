require "emoruby/version"

module Emoruby
  TRANSLATIONS = {
    [240, 159, 147, 139] => "class", #=> :clipboard:
    [240, 159, 148, 156] => "def",
    [240, 159, 145, 128] => "puts",
    [240, 159, 146, 172] => "\"",
    [240, 159, 148, 154] => "end",
    [226, 150, 170] => ".",
    [240, 159, 144, 163] => "new",

    # evil problematic whitespace
    [239,184,143] => "",

    # cheats until i can translate names
    [226, 157, 164] => "HeavyBlackHeart",
    [240, 159, 145, 139] => "waving_hand_sign",
    [240, 159, 152, 131] => "Smiling face with open mouth",
    [240, 159, 140, 143] => "Earth globe asia-australia",
  }

  def self.translate(source)
    source.chars.map do |char|
      if TRANSLATIONS.has_key?(char.bytes)
        TRANSLATIONS[char.bytes]
      elsif char.bytes.size > 1
        binding.pry
      else
        char
      end
    end.join
  end
end
