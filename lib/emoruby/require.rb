module Emoruby
  class Require
    def self.load(filename, options = nil)
      Emoruby.eval(File.read(filename))
    end

    def self.register(file_extension)
      require 'polyglot'
      Polyglot.register(file_extension, Emoruby::Require)
      return
    end
  end
end
