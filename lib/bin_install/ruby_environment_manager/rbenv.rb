module BinInstall
  module RubyEnvironmentManager
    module Rbenv

      def self.install(version = nil)
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade('rbenv')
        Brew.install_or_upgrade('ruby-build')
        Shell.append_to_profile(%{eval "$(rbenv init -)"\n})
        system('eval "$(rbenv init -)"')
        install_ruby(version)
        version
        rehash
        doctor
      end

      def self.install!(version = nil)
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade!('rbenv')
        Brew.install_or_upgrade!('ruby-build')
        Shell.append_to_profile(%{eval "$(rbenv init -)"\n})
        BinInstall.system!('eval "$(rbenv init -)"')

        install_ruby!(version)
        version!
        rehash!
        doctor!
      end

      def self.install_ruby(version = nil)
        version ||= RubyEnvironmentManager.required_ruby_version

        if version
          if RubyEnvironmentManager.ruby_version_installed?(version)
            puts "Ruby #{version} is already installed. Skipping.".blue
          else
            system("rbenv install #{version}")
          end
        else
          puts 'Unknown Ruby version. Create `.ruby-version` file.'
        end
      end

      def self.install_ruby!(version = nil)
        version ||= RubyEnvironmentManager.required_ruby_version

        if version
          if RubyEnvironmentManager.ruby_version_installed?(version)
            puts "Ruby #{version} is already installed. Skipping.".blue
          else
            BinInstall.system!("rbenv install #{version}")
          end
        else
          abort('Unknown Ruby version. Create `.ruby-version` file.')
        end
      end

      def self.doctor
        system('curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash')
      end

      def self.doctor!
        BinInstall.system!('curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash')
      end

      def self.rehash
        system('rbenv rehash')
      end

      def self.rehash!
        BinInstall.system!('rbenv rehash')
      end

      def self.version
        system('rbenv version')
      end

      def self.version!
        BinInstall.system!('rbenv version')
      end

      def self.installed?
        Shell.executable_exists?('rbenv')
      end
    end
  end
end
