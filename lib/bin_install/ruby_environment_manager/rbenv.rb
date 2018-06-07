module BinInstall
  module RubyEnvironmentManager
    module Rbenv
      def self.install
        if installed?
          puts 'rbenv is already installed. Skipping.'.blue
          Brew.upgrade_package('rbenv')
          Brew.install_or_upgrade('ruby-build')
        else
          first_install!
        end
      end

      def self.install!
        if installed?
          puts 'rbenv is already installed. Skipping.'.blue
          Brew.upgrade_package!('rbenv')
          Brew.install_or_upgrade!('ruby-build')
        else
          first_install!
        end
      end

      def self.first_install
        puts 'Installing rbenv...'.white
        Brew.install_package('rbenv')
        Brew.install_or_upgrade('ruby-build')
        Shell.append_to_profiles(%{eval "$(rbenv init -)"\n})

        version
        rehash
        doctor
        reload_shell!
      end

      def self.first_install!
        puts 'Installing rbenv...'.white
        Brew.install_package!('rbenv')
        Brew.install_or_upgrade!('ruby-build')
        Shell.append_to_profiles(%{eval "$(rbenv init -)"\n})

        version!
        rehash!
        doctor!
        reload_shell!
      end

      def self.reload_shell!
        puts 'Shell must be reloaded.'.red
        puts 'Close this window and restart installer with:'
        puts '$ gem install bin_install'.bright
        puts '$ bin/install'.bright
        abort()
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
          puts 'Unknown Ruby version. Create .ruby-version file.'
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
          abort('Unknown Ruby version. Create .ruby-version file.')
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
