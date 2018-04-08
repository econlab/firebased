## NO LONGER MAINTAINED ##

# Firebased

A ruby gem to deploy and manage Firebase instances programaticaly. Based off of [firebase-admin](https://github.com/casetext/firebase-admin) by [casetext](https://github.com/casetext).

Only create/get/delete implemented, will do more when time/necesity demands it (or a blessed soul submits a pull request).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'firebased'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install firebased


## Configure

First, put your Firebase account email and password in some environment files.

Then either in an initializer if on rails, or wherever else, include a config block:

```ruby
Firebased.configure do |config|
  config.email    = ENV['FIREBASE_EMAIL']
  config.password = ENV['FIREBASE_PASS']
end
```


## Usage

#### Create a Firebase

```ruby
fb = Firebased.create_firebase('my-firebase-url-slug', 'My Optional Firebase Name')
```

#### Retrieve a Firebase

```ruby
fb = Firebased.get_firebase('my-firebase-url-slug')
```

#### Delete a Firebase

```ruby
Firebased.delete_firebase('my-firebase-url-slug')
```

## Contributing

1. Fork it ( https://github.com/econlab/firebased/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
