require 'pathname'

module FileHelpers
  def load_fixture(name, type = "emoruby")
    File.read(Pathname.pwd.join("spec","fixtures","#{name}.#{type}"))
  end
end
