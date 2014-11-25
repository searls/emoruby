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

    def initialize(source)
      @source = source
    end

    def call
      translate_lines(@source.lines).join("")
    end

  private

    def translate_lines(lines)
      lines.map do |line|
        chars = clean_chars(scan_and_translate_doublebyte(scan_and_translate_constants(line)).chars)
        comments = false

        translate_chars(chars) do |char|
          next if comments
          emo_char = emoji_name_for(char)
          comments ||= (emo_char == '#')
          emo_char
        end
      end
    end

    def scan_and_translate_constants(source)
      find_and_replace(source, constant_map.keys, constant_map)
    end

    def scan_and_translate_doublebyte(source)
      find_and_replace(source, EmojiData.scan(source).select(&:doublebyte?).map(&:to_s), TRANSLATIONS)
    end

    def find_and_replace(source, search, replacements)
      source.gsub(Regexp.new(search.map {|x| Regexp.escape(x)}.join('|')), replacements)
    end

    def constant_map
      @constant_map ||= Hash[
        @source.split(/\s+/).each_cons(2).map do |operator, emo_constant|
          next unless ['class', 'module'].include?(emoji_name_for(operator))
          [
            emo_constant,
            Util::String.classify(emo_constant.chars.map {|c| emoji_name_for(c) }.join)
          ]
        end.compact
      ]
    end

    def clean_chars(source)
      source.reject {|c| GARBAGE.include?(c.bytes) }
    end

    def translate_chars(chars)
      chars.each_with_index.map do |char, index|
        yield(char, index) || char
      end.join
    end

    def emoji_name_for(char)
      return unless emoji = EmojiData.find_by_str(char).first
      TRANSLATIONS[emoji.to_s] || emoji.short_name
    end
  end
end
