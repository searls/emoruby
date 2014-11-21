require 'emoji_data'

class ConvertsEmojiToRuby
  TRANSLATIONS = {
    "clipboard" => "class",
    "soon" => "def",
    "eyes" => "puts",
    "speech_balloon" => "\"",
    # "end" => "end", #<- redundant!
    "black_small_square" => ".",
    "hatching_chick" => "new",

    # cheats until i can translate names
    "heart" => "Heart"
  }

  GARBAGE = [
    [239,184,143] # evil problematic whitespace where is it from where am i what even
  ]

  def call(source)
    translate_chars(clean_chars(source.chars)) do |char, previous_translation|
      if emoji_name = emoji_name_for(char)
        emoji_name
      end
    end
  end

private

  def emoji_name_for(char)
    return unless emoji = EmojiData.find_by_str(char).first
    TRANSLATIONS[emoji.short_name] || emoji.short_name
  end

  def clean_chars(source)
    source.reject {|c| GARBAGE.include?(c.bytes) }
  end

  def translate_chars(chars)
    previous_translation = nil
    chars.each_with_index.map do |original_char, i|
      previous_translation = if new_char = yield(original_char, previous_translation, i)
        new_char
      else
        original_char
      end
    end.join
  end
end
