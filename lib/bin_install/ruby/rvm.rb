module BinInstall
  module Ruby
    module Rvm
      INSTALL = '\curl -sSL https://get.rvm.io | bash'.freeze

      def self.install
        puts 'Installing RVM...'.white
        system(INSTALL)
        install_ruby
      end

      def self.install!
        puts 'Installing RVM...'.white
        BinInstall.system!(INSTALL)
        install_ruby!
      end

      def self.install_ruby(version = nil)
        version ||= Ruby.required_ruby_version

        if version
          system("rvm install #{version}")
          system("rvm use #{version}")
        else
          puts 'Unknown Ruby version. Create .ruby-version file.'
        end
      end

      def self.install_ruby!(version = nil)
        version ||= Ruby.required_ruby_version

        if version
          BinInstall.system!("rvm install #{version}")
          BinInstall.system!("rvm use #{version}")
        else
          abort('Unknown Ruby version. Create .ruby-version file.'.red)
        end
      end

      def self.installed?
        Shell.executable_exists?('rvm')
      end
    end
  end
end
