describe Emoruby do
  Given(:source) { load_fixture("2_module_with_addition") }
  When { Emoruby.eval(source) }
  Then { Cool.chart(4,2) == 6 }
end
