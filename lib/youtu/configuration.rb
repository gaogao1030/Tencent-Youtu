require 'active_support/configurable'
require 'active_support/core_ext/numeric/time'

module Youtu
  class << self
    def configure
      yield @_config ||= Youtu::Configuration.new
    end

    def config
      @_config
    end
  end

  class Configuration
    include ActiveSupport::Configurable
    config_accessor :app_id,:secret_id,:secret_key,:user_id,:expired,:random_length,:host,:signature_file
  end

  configure do |config|
    config.host = "http://api.youtu.qq.com"
    config.app_id = ''
    config.secret_id = ''
    config.secret_key = ''
    config.user_id = ''
    config.expired = 30.days
    config.random_length = 10
    config.signature_file = "/tmp/youtu_signature"
  end

end
