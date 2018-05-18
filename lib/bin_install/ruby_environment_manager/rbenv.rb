module BinInstall
  module RubyEnvironmentManager
    module Rbevn
      def self.install(version = nil)
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade('rbenv')
        Brew.install_or_upgrade('ruby-build')
        install_ruby(version)
      end

      def self.install!(version = nil)
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade!('rbenv')
        Brew.install_or_upgrade!('ruby-build')
        install_ruby!(version)
      end

      def self.install_ruby(version = nil)
        version ||= RubyEnvironmentManager.ruby_version

        if version
          system("rbenv install #{version}")
        else
          puts 'Unknown Ruby version. Create `.ruby-version` file.'
        end
      end

      def self.install_ruby!(version = nil)
        version ||= RubyEnvironmentManager.ruby_version

        if version
          BinInstall.system!("rbenv install #{version}")
        else
          abort('Unknown Ruby version. Create `.ruby-version` file.')
        end
      end

      def self.installed?
        system('rbenv --version')
      end
    end
  end
end
