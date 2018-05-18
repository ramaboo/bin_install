module BinInstall
  module RubyEnvironmentManager
    module Rvm
      def self.install_ruby(version = nil)
        version ||= RubyEnvironmentManager.ruby_version

        if version
          system("rvm install #{version}")
        else
          puts 'Unknown Ruby version. Create `.ruby-version` file.'
        end
      end

      def self.install_ruby!(version = nil)
        version ||= RubyEnvironmentManager.ruby_version

        if version
          BinInstall.system!("rvm install #{version}")
        else
          abort('Unknown Ruby version. Create `.ruby-version` file.')
        end
      end

      def self.installed?
        system('rvm --version')
      end
    end
  end
end
