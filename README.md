# Youtu

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/youtu`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'youtu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install youtu

## Usage

You'll need to configure it. 
```ruby
  #config/intialize/youtu.rb
  Youtu.configure do |config|
    config.app_id = "app_id"
    config.secret_id = "secret ID"
    config.secret_key = "secret key"
    config.user_id = "your QQ number"
  end
```

And then you can refer to the following example to use it.
```ruby
  image_url_params = {
    url: "imagePath"
    mode: "1"
  }

  Youtu::Request.post("/youtu/api/detectface",image_url_params){|response,request,result|
  data = JSON.parse(response.body)
}
```

For more infomation, please read [https://open.youtu.qq.com/welcome/developer#/api-summary](https://open.youtu.qq.com/welcome/developer#/api-summary)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gaogao1030/youtu.

