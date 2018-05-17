require 'rails/generators/base'

module BinInstall
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Copies install scripts to your application.'
      def copy_install_scripts
        puts 'here'
      end
    end
  end
end
