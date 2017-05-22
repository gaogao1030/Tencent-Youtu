module Youtu
  module Generators
    class  InstallGenerator < Rails::Generators::Base
      desc "Install Youtu Configure file"
      source_root File.expand_path('../templates',__FILE__)

      def copy_config
        template 'config/initializers/youtu.rb'
      end
    end

  end
end
