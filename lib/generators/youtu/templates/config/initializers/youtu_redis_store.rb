module Youtu
  class << self
    def redis
      @redis ||= Redis.new
    end
  end

  module Sign
    class << self

      protected

      def read_signature
        JSON.parse(Youtu.redis.get(redis_key)) || {}
      end

      def write_signature(sign_hash)
        Youtu.redis.set(redis_key,sign_hash.to_json)
      end

      private

      def redis_key
        "youtu_sign_#{Youtu.config.app_id}"
      end
    end
  end

end
