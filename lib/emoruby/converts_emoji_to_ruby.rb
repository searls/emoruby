require 'emoji_data'
require 'emoruby/util/string'

require 'yaml'
require 'pathname'

module Emoruby
  class ConvertsEmojiToRuby
    TRANSLATIONS = YAML.load(File.read(Pathname.new(File.dirname(__FILE__)).join("..","..","config","translations.yml")))

    GARBAGE = [
      [239,184,143] # evil problematic whitespace where is it from where am i what even
    ]

    def call(source)
      chars = clean_chars(scan_and_translate_constants(source).chars)

      translate_chars(chars) do |char|
        next unless emoji_name = emoji_name_for(char)
        emoji_name
      end
    end

  private

    def scan_and_translate_constants(source)
      constant_map = Hash[source.split(/\s+/).each_cons(2).map do |operator, emo_constant|
        next unless ["class", "module"].include?(emoji_name_for(operator))
        [emo_constant, Util::String.classify(emo_constant.chars.map {|c| emoji_name_for(c) }.join)]
      end.compact]

      source.gsub(Regexp.new(constant_map.keys.map { |x| Regexp.escape(x) }.join('|')), constant_map)
    end

    def emoji_name_for(char)
      return unless emoji = EmojiData.find_by_str(char).first
      TRANSLATIONS[emoji.to_s] || emoji.short_name
    end

    def clean_chars(source)
      source.reject {|c| GARBAGE.include?(c.bytes) }
    end

    def translate_chars(chars)
      chars.each_with_index.map do |original_char, i|
        if new_char = yield(original_char, i)
          new_char
        else
          original_char
        end
      end.join
    end
  end
end
