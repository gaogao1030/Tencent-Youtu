Youtu.configure do |config|
  config.app_id         = ENV["YOUTU_APPID"]
  config.secret_id      = ENV["YOUTU_SECRETID"]
  config.secret_key     = ENV["YOUTU_SECRETKEY"]
  config.user_id        = ENV["YOUTU_USERID"]
  #config.host           = "http://api.youtu.qq.com"
  #config.expired        = 30.days
  #config.random_length  = 10
  #config.signature_file = "/tmp/youtu_signature"
end
