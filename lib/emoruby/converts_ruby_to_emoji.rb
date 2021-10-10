require "emoji_data"
require "emoruby/util/string"

require "yaml"
require "pathname"

module Emoruby
  class ConvertsRubyToEmoji
    TRANSLATIONS = YAML.safe_load(File.read(Pathname.new(File.dirname(__FILE__)).join("..", "..", "config", "translations.yml"))).invert

    GARBAGE = [
      [239, 184, 143] # evil problematic whitespace where is it from where am i what even
    ]

    def initialize(source)
      @source = source
    end

    def call
      translate_lines(@source.lines).join("")
    end

    private

    def translate_lines(lines)
      lines.map do |line|
        chars = line.split(/\b/)
        comments = false

        chars.map do |char|
          next if comments
          if char != " "
            emoji_char_for(char.gsub("ITISHEREADOT", "."))
          else
            char
          end
        end.join
      end
    end

    def emoji_data_for(char)
      EmojiData.from_short_name(char.to_s).to_s
    end

    def emoji_char_for(char)
      starts, ends = nil, nil

      if char.start_with?(".", " ")
        starts = char[0]
        if char.end_with?(starts)
          ends = char[-1]
          char.chop!
        end
        char = char.reverse.chop.reverse
      elsif char.end_with?(".", " ")
        ends = char[-1]
        char.chop!
      end

      emoji = TRANSLATIONS[char.strip] || emoji_data_for(char.strip)
      [starts, emoji, ends].compact.join
    end
  end
end
