# ProMotion-form

[![Gem Version](https://badge.fury.io/rb/ProMotion-form.svg)](http://badge.fury.io/rb/ProMotion-form) [![Build Status](https://travis-ci.org/clearsightstudio/ProMotion-form.svg)](https://travis-ci.org/clearsightstudio/ProMotion-form) [![Code Climate](https://codeclimate.com/github/clearsightstudio/ProMotion-form/badges/gpa.svg)](https://codeclimate.com/github/clearsightstudio/ProMotion-form)

ProMotion-form provides a PM::FormScreen for the
popular RubyMotion gem [ProMotion](https://github.com/clearsightstudio/ProMotion).

![form](http://i.imgur.com/pQbGqK1.png)

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
    [{
      title: "Account Information",
      footer: "Some help text",
      cells: [{
        name: "email",
        title: "ID",
        type: :email,
        value: current_user.email,
      }, {
        name: "password",
        title: "New Password",
        type: :password,
        value: ""
      }]
    }]
  end

end
```

*Can also be driven by properties available in [FXForms](https://github.com/nicklockwood/FXForms) Docs.

```ruby
class MyFormScreen < PM::FormScreen
  title "My Form"

  def form_data
    [{
      title: "Account Information",
      footer: "Some help text",
      cells: [{
        key: "email",
        label: "ID",
        type: :email,
        "textLabel.font" => UIFont.fontWithName('Helvetica-Light', size: 25),
        value: current_user.email,
      }, {
        key: "password",
        label: "New Password",
        type: :password,
        "textLabel.color" => UIColor.blueColor,
        value: ""
      }]
    }]
  end

end
```

### What about Formotion?

We have used and like Formotion for some form-heavy apps, but it's a rather bulky gem. ProMotion-form works better with ProMotion and is a lot smaller.

---

### Methods

#### form_data

Method that is called to build the form.

```ruby
class AccountScreen < PM::FormScreen
  title "Account Info"

  def form_data
    [{
      title: "Account Information",
      footer: "Help text here",
      cells: [{
        name: "email",
        title: "ID",
        type: :email,
        value: current_user.email,
      }, {
        name: "password",
        title: "Password",
        type: :password,
        value: ""
      }, {
        name: :submit,
        title: "Submit",
        type: :button,
        action: "my_action:"
      }]
    }]
  end

  def my_action(cell)
    # cell is the calling cell, in this case the Submit cell
    render_form # use to save the data
  end
end
```

All form field properties from FXForms are exposed.  A full listing can be found [here in their Readme](https://github.com/nicklockwood/FXForms#form-field-properties).

Additional "helper" field properties have been started, and are listed below:
  * `name` - a convenience alias to FXForms `key`. If no name is provided, title is converted to a symbol and used as the key.
  * `title` - when no title is provided, label and then name are used respectively.
  * `cell_class` - a convenience alias to FXForms `cell`, but with the ProMotion naming scheme.
}
```

Here are sample form fields with some explanation

```ruby
{
  label: "Name", # or title
  name: :name, # defaults to symbol of snake_cased label/title
  type: :string, # :default is default...like a button
  options: [ "Water", "Fire", "Wind" ], # for a subform select (`type` can be anything)
  placeholder: "Your name",
  default: "Jamon", # Coming soon
  value: "Jamon Holmgren",
  action: :"my_action:" # use symbol literal with trailing colon due to Obj-C semantics
}
```

##### Types of fields:

* `:default`
* `:label`
* `:text`
* `:longtext`
* `:url`
* `:email`
* `:phone` - Coming soon
* `:password`
* `:number`
* `:integer`
* `:unsigned` - Coming soon
* `:float`
* `:bitfield`
* `:boolean`
* `:option`
* `:date`
* `:time`
* `:datetime`
* `:image`


#### update_form_data

Forces a reload of the form.  This is useful when your have changed the hash you returned in your `form_data` method.

#### render_form

Returns a hash of the fields and values.

```ruby
render_form # => {:email=>"jkdflsljkdsfad", :password=>"asdfadsfadsf", :submit=>""}
```

#### dismiss_keyboard

Dismisses the keyboard. Note that you may need to call this before `render_form` to ensure that you capture the input from the currently focused form element.

---

### Class Methods

None yet.

---

### Accessors

#### form_object (read only)

This is a Struct with a `#fields` method (which is used to build the form in FXForms) and writeable properties for each field.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Make some specs pass
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
