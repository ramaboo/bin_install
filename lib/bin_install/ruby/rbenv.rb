module BinInstall
  module Ruby
    module Rbenv
      def self.install
        if installed?
          puts 'rbenv is already installed. Skipping.'.blue
          Brew::Package.upgrade('rbenv')
          Brew::Package.install_or_upgrade('ruby-build')
        else
          first_install
        end
      end

      def self.install!
        if installed?
          puts 'rbenv is already installed. Skipping.'.blue
          Brew::Package.upgrade!('rbenv')
          Brew::Package.install_or_upgrade!('ruby-build')
        else
          first_install!
        end
      end

      def self.first_install
        puts 'Installing rbenv...'.white
        Brew::Package.install('rbenv')
        Brew::Package.install_or_upgrade('ruby-build')
        Shell.append_to_profiles(%{eval "$(rbenv init -)"\n})

        version
        rehash
        doctor
        puts 'First install done **************************'
      end

      def self.first_install!
        puts 'Installing rbenv...'.white
        Brew::Package.install!('rbenv')
        Brew::Package.install_or_upgrade!('ruby-build')
        Shell.append_to_profiles(%{eval "$(rbenv init -)"\n})

        version!
        rehash!
        doctor!
      end

      def self.reload_shell!
        puts 'Warning rbenv requires reloading the shell'.yellow
        puts 'Close this shell and rerun the installer with:'.red
        puts '$ bin/install'.cyan
        abort('Can not continue.'.red)
      end

      def self.install_ruby(version = nil)
        version ||= Ruby.required_ruby_version
        puts "Installing Ruby #{version}...".white

        if version
          if Ruby.ruby_version_installed?(version)
            puts "Ruby #{version} is already installed. Skipping.".blue
          else
            system("rbenv install #{version}")
            reload_shell!
          end
        else
          puts 'Unknown Ruby version. Create .ruby-version file.'
        end
      end

      def self.install_ruby!(version = nil)
        version ||= Ruby.required_ruby_version
        puts "Installing Ruby #{version}...".white

        if version
          if Ruby.ruby_version_installed?(version)
            puts "Ruby #{version} is already installed. Skipping.".blue
          else
            BinInstall.system!("rbenv install #{version}")
            reload_shell!
          end
        else
          abort('Unknown Ruby version. Create .ruby-version file.'.red)
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
