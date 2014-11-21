require "emoruby/version"
require "emoruby/emoji_script"

# TODO there has to be a better way to eval on top of the world, right?
def __emoruby_top_level_binding_eval(source)
  binding.eval(source)
end

module Emoruby
  def self.emoji_to_ruby(source)
    EmojiScript.new(source).to_ruby
  end

  def self.eval(source)
    __emoruby_top_level_binding_eval(emoji_to_ruby(source))
  end

  def self.register
    require 'emoruby/require'
    Require.register
  end
end
