# emoruby

A little language that compiles Emoji down to Ruby. It's just Ruby. Really.

## The Language

If I were a real programming language designer, I would have put a lot of thought into the syntax, semantics, and structure of emoruby. Instead I basically implemented a very inefficient find and replace from a fixed dictionary. (🐄🎩!)

Anyway, here is an example hello world program:

``` emoruby
📋 ❤️
  🔜 👋
    👀 💬😃 🌏💬
  🔚
🔚

❤️▪️🐣▪️👋
```

## gem usage

### command line

``` shell
$ emoruby spec/fixtures/1-hello-world.emoruby 
smiley earth_asia
```

### API

The API allows both evaluation of emoruby code as well as translation to Ruby.

``` ruby
> source = "💬😃 🌏💬" 
=> "💬😃 🌏💬"
> Emoruby.eval(source)
=> "smiley earth_asia"
Emoruby.emoji_to_ruby(source)
=> "\"smiley earth_asia\""
```

## Versioning

The Emoruby team embraces the iconographic versioning standard ("icover" for short). 

The initial release was 💩 (in honor of @tenderlove's 💩-lang). The next planned release is ✊.