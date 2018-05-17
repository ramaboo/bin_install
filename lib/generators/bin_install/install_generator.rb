require 'rails/generators/base'

module BinInstall
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Copies scripts to your bin directory.'
      def copy_scripts
        copy_bin_file 'install'
        copy_bin_file 'update'
        copy_bin_file 'kill'
      end

      private

      def copy_bin_file(file)
        copy_file file, "bin/#{file}"
        FileUtils.chmod(0744, "bin/#{file}")
      end
    end
  end
end
