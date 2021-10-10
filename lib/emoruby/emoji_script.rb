require "emoruby/converts_emoji_to_ruby"

module Emoruby
  class EmojiScript
    attr_reader :source

    def initialize(source)
      @source = source
    end

    def to_ruby
      @ruby ||= ConvertsEmojiToRuby.new(@source).call
    end

    def eval
      eval(to_ruby) # standard:disable Security/Eval
    end
  end
end
