# ProMotion-form

[![Gem Version](https://badge.fury.io/rb/ProMotion-form.svg)](http://badge.fury.io/rb/ProMotion-form) [![Build Status](https://travis-ci.org/clearsightstudio/ProMotion-form.svg)](https://travis-ci.org/clearsightstudio/ProMotion-form) [![Code Climate](https://codeclimate.com/github/clearsightstudio/ProMotion-form.png)](https://codeclimate.com/github/clearsightstudio/ProMotion-form)

ProMotion-form provides a PM::FormScreen for the
popular RubyMotion gem [ProMotion](https://github.com/clearsightstudio/ProMotion).

## Installation

```ruby
gem 'ProMotion-form'
```

Then:

```sh-session
$ bundle
$ rake pod:install
```

## Usage

Easily create a form screen. Powered by the CocoaPod [FXForms](https://github.com/nicklockwood/FXForms).

*Has all the methods of PM::Screen*

```ruby
class MyFormScreen < PM::FormScreen
  title "My Form"

  def form_data
    []
  end

end
```

### Why not Formotion?

We've used and like Formotion for some form-heavy apps, but it's a rather bulky gem. ProMotion-form works better with ProMotion and is a lot lighter.

---

### Methods

#### form_data

Method that is called to build the form.

```ruby
def form_data
  []
end
```

All possible properties:

```ruby
{
  label: "Name",
  type: :string
}
```

#### update_form_data

Forces a reload of the form.

---

### Class Methods

None yet.

---

### Accessors

None yet.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Make some specs pass
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
