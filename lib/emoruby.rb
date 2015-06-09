require "emoruby/version"
require "emoruby/emoji_script"
require "emoruby/converts_ruby_to_emoji"
require "stringio"

module Emoruby
  def self.emoji_to_ruby(source)
    EmojiScript.new(source).to_ruby
  end

  def self.ruby_to_emoji(source)
    ConvertsRubyToEmoji.new(source).call
  end

  def self.capture_eval(source)
    begin
      $stdout = StringIO.new
      eval(source)
      $stdout.string.rstrip.inspect
    ensure
      $stdout = STDOUT
    end
  end

  def self.eval(source)
    TOPLEVEL_BINDING.eval(emoji_to_ruby(source))
  end

  def self.eval_to_emoji(source)
    ruby_to_emoji(eval(source))
  end

  def self.register(file_extension = "emoruby")
    require 'emoruby/require'
    Require.register(file_extension)
  end
end
