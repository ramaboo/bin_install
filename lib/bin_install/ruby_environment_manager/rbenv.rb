module BinInstall
  module RubyEnvironmentManager
    module Rbenv
      def self.install(version = nil)
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade('rbenv')
        Brew.install_or_upgrade('ruby-build')
        File.open(Shell.profile, 'a') { |f| f << %{eval "$(rbenv init -)"\n} }

        install_ruby(version)
        system('rbenv rehash')
      end

      def self.install!(version = nil)
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade!('rbenv')
        Brew.install_or_upgrade!('ruby-build')
        File.open(Shell.profile, 'a') { |f| f << %{eval "$(rbenv init -)"\n} }

        install_ruby!(version)
        Brew.install!('rbenv rehash')
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
        Shell.executable_exists?('rbenv')
      end
    end
  end
end
