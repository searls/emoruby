# emoruby
Use Emoji™

[![Build Status](https://travis-ci.org/searls/emoruby.svg?branch=master)](https://travis-ci.org/searls/emoruby) [![Code Climate](https://codeclimate.com/github/searls/emoruby/badges/gpa.svg)](https://codeclimate.com/github/searls/emoruby) [![Test Coverage](https://codeclimate.com/github/searls/emoruby/badges/coverage.svg)](https://codeclimate.com/github/searls/emoruby)

A little language that compiles Emoji down to Ruby. It's just Ruby. Really.

## The Language

If I were a real language designer, I would have put a lot of thought into the syntax, semantics, and structure of emoruby. Instead I basically implemented an inefficient find-and-replace from a static dictionary. (🐄🎩!)

### hello world

Anyway, here is an example hello world program:

```emoruby
📋 ❤️
  🔜 👋
    👀 💬😃 🌏💬
  🔚
🔚

❤️▪️🐣▪️👋
```

which is equivalent to this Ruby:

``` ruby
class Heart
  def wave
    puts "smiley earth_asia"
  end
end

Heart.new.wave
```

### procs and comments

You can also define things like Procs and comments:

```emoruby
💭 Comment! 👋
👉 🔨
 💬😃💬
🔚▪️📞
```

which is equivalent to this Ruby:

```ruby
# Comment! 👋
-> do
  "smiley"
end.call
```

### enumerables and block params

You can also define Array and Hash literals, and use the `{}` block syntax:

```emoruby
◀️9️⃣➰3️⃣▶️▪️📍 ⏪ 🏂🅰🏂 🅰 ➕ 1 ⏩
```

Which translates to this Ruby:

```
[9,3].map { |a| a + 1 }
```

### method visibility

You can define private and protected methods:

```emoruby
📋 ❤️
  🔓 🔜 👖
    👀 💬👛💬
  🔚

  🔒️ 🔜 👕
    👀 💬💛💬
  🔚

  ⛔️ 🔜 👋
    👀 💬😃 🌏💬
  🔚
🔚

❤️▪️🐣▪️👋
```

which is equivalent to this Ruby:

```ruby
class Heart
  public def jeans
    puts "purse"
  end

  protected def shirt
    puts "yellow_heart"
  end

  private def wave
    puts "smiley earth_asia"
  end
end

Heart.new.wave
```

Which will result in an exception:

```
NoMethodError: private method `wave' called for #<Heart:0x007f81eb840138>
```

## Using the gem

### registering the ".emoruby" file extension

Emoruby uses polyglot to enable `require` to be used on `.emoruby` files just as you do with Ruby source `.rb` files. To register the file extension, simply:

```ruby
> require 'emoruby'
=> true
> Emoruby.register
=> nil
> require 'hello_world'
smiley earth_asia
=> true
```

### command line

You can run emoruby from the command line by passing an emoruby file as the first argument:

```shell
$ emoruby spec/fixtures/1_hello_world.emoruby
smiley earth_asia
```

### API

The API allows both evaluation of emoruby code as well as translation to Ruby.

```ruby
> source = "💬😃 🌏💬"
=> "💬😃 🌏💬"
> Emoruby.eval(source)
=> "smiley earth_asia"
Emoruby.emoji_to_ruby(source)
=> "\"smiley earth_asia\""
```

## Versioning

The Emoruby team embraces and advocates the adoption of the the emerging emotional versioning standard ("emover" for short).

The initial release was 💩 (in honor of @tenderlove's 💩-lang). After that, ✊ was released. Then came 🐷. The next planned release is 📈.
