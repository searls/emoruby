require "emoruby/version"
require "emoruby/emoji_script"
require "emoruby/converts_ruby_to_emoji"

module Emoruby
  def self.emoji_to_ruby(source)
    EmojiScript.new(source).to_ruby
  end

  def self.ruby_to_emoji(source)
    ConvertsRubyToEmoji.new(source).call
  end

  def self.eval(source)
    TOPLEVEL_BINDING.eval(emoji_to_ruby(source))
  end

  def self.register(file_extension = "emoruby")
    require 'emoruby/require'
    Require.register(file_extension)
  end
end
