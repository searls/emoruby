# Ripped pretty much right out of activesupport 4.1.8
# activesupport/lib/active_support/inflector/methods.rb

module Emoruby
  module Util
    module String
      def self.classify(string)
        camelize(string.sub(/.*\./, ""))
      end

      def self.camelize(term)
        string = term.to_s
        string = string.sub(/^[a-z\d]*/) { $&.capitalize }
        string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }
        string.gsub!("/", "::")
        string
      end
    end
  end
end
