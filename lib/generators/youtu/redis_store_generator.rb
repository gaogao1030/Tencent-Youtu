module Youtu
  module Generators
    class  RedisStoreGenerator < Rails::Generators::Base
      desc "Using redis as signature store"
      source_root File.expand_path('../templates',__FILE__)

      def copy_config
        template 'config/initializers/youtu_redis_store.rb'
      end
    end

  end
end
