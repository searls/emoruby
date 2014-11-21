require "emoruby/version"

require 'emoji_data'

module Emoruby
  TRANSLATIONS = {
    "clipboard" => "class",
    "soon" => "def",
    "eyes" => "puts",
    "speech_balloon" => "\"",
    "end" => "end", #<- redundant!
    "black_small_square" => ".",
    "hatching_chick" => "new",

    # cheats until i can translate names
    "heart" => "Heart"
  }

  GARBAGE = [
    [239,184,143] # evil problematic whitespace where is it from where am i what even
  ]

  def self.translate(source)
    source.chars.map do |char|
      if emoji = EmojiData.find_by_str(char).first
        TRANSLATIONS[emoji.short_name] || emoji.short_name
      elsif GARBAGE.include?(char.bytes)
        ""
      else
        char
      end
    end.join
  end
end
