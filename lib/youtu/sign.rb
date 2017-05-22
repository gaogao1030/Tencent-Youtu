module Youtu
  module Sign
    class << self
      def refresh_sign
        _current_time = Time.now
        _app_id       =  Youtu.config.app_id
        _secret_id    =  Youtu.config.secret_id
        _secret_key   =  Youtu.config.secret_key
        _user_id      =  Youtu.config.user_id
        _time_stamp   =  _current_time.to_i
        _expired_at   =  (_current_time + Youtu.config.expired).to_i
        _r            =  random(Youtu.config.random_length)
        _original = "u=#{_user_id}&a=#{_app_id}&k=#{_secret_id}&e=#{_expired_at}&t=#{_time_stamp}&r=#{_r}&f="
        _hmac = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'),_secret_key,_original)
        _signature  = Base64.strict_encode64(_hmac+_original)
        sign_hash = {
          signature: _signature,
          expired_at: _expired_at,
          got_signature_at: _current_time
        }
        write_signature_to_store(sign_hash)
        read_signature_from_store
      end

      def signature
        sign_json = read_signature_from_store
        _expired_at = sign_json["expired_at"].to_i
        sign_json = refresh_sign if Time.now.to_i - _expired_at > 0
        sign_json["signature"]
      end

      def random(length)
        length ||= 9
        seed = "0123456789"
        length.times.inject(''){ |acc, t|
          acc + seed[Random.rand(seed.length)]
        }
      end

      protected

      def read_signature_from_store
        _signature = read_signature
      rescue JSON::ParserError, Errno::ENOENT, KeyError, TypeError
        refresh_sign
      end

      def write_signature_to_store(sign_hash)
        write_signature(sign_hash)
      end

      def read_signature
        JSON.parse(File.read(Youtu.config.signature_file))
      end

      def write_signature(sign_hash)
        File.write(Youtu.config.signature_file,sign_hash.to_json)
      end

    end
  end
end
