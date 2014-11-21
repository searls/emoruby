require 'emoruby/converts_emoji_to_ruby'

module Emoruby
  class EmojiScript
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def to_ruby
      @ruby ||= ConvertsEmojiToRuby.new.call(@source)
    end

    def eval
      eval(to_ruby)
    end
  end
end
