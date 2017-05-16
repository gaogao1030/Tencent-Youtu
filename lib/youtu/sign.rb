require 'openssl'
require 'base64'

module Youtu
  module Sign
    class << self
      def gen_sign
        _app_id      =  Youtu.config.app_id
        _secret_id   =  Youtu.config.secret_id
        _secret_key  =  Youtu.config.secret_key
        _user_id     =  Youtu.config.user_id
        _time_stamp  =  Time.now.to_i
        _expired     =  (Time.now + Youtu.config.expired).to_i
        _r           =  random(Youtu.config.random_length)
        _original = "u=#{_user_id}&a=#{_app_id}&k=#{_secret_id}&e=#{_expired}&t=#{_time_stamp}&r=#{_r}&f="
        _hmac = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'),_secret_key,_original)
        _signature  = Base64.strict_encode64(_hmac+_original)
        _signature
      end

      def random(length)
        length ||= 9
        seed = "0123456789"
        length.times.inject(''){ |acc, t|
          acc + seed[Random.rand(seed.length)]
        }
      end
    end

  end
end
