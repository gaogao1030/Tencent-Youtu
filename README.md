# Youtu

http://open.youtu.qq.com/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'youtu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install youtu

Run the generator
    
    rails g youtu:install

`rails g youtu:install` will generated the youtu.rb intialize file in config/initialze/youtu.rb


Signature's default store is File storage,but you can using Redis to store signature(optional)
  
    rails g youtu:redis_store

`rails g youtu:install` will generated the youtu.rb initialize file in config/initialze/youtu_redis_store.rb


## Usage

And then you can refer to the following example to use it.
```ruby
  image_url_params = {
    url: "imagePath"
    mode: 1
  }

  Youtu::Request.post("/youtu/api/detectface",image_url_params) do |response,request,result|
    data = JSON.parse(response.body)
  end
```

For more infomation, please read [https://open.youtu.qq.com/welcome/developer#/api-summary](https://open.youtu.qq.com/welcome/developer#/api-summary)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gaogao1030/youtu.

