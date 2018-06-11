module BinInstall
  module Ruby
    module Rbenv
      def self.install
        puts 'Installing rbenv...'.white
        Brew::Package.install('rbenv')
        Brew::Package.install_or_upgrade('ruby-build')
        Shell.append_to_profiles(%{eval "$(rbenv init -)"\n})
        require_doctor!
        install_ruby
        require_doctor!
      end

      def self.install!
        puts 'Installing rbenv...'.white
        Brew::Package.install!('rbenv')
        Brew::Package.install_or_upgrade!('ruby-build')
        Shell.append_to_profiles!(%{eval "$(rbenv init -)"\n})
        require_doctor!
        install_ruby!
        require_doctor!
      end

      def self.install_ruby(version = nil)
        version ||= Ruby.required_ruby_version
        puts "Installing Ruby #{version}...".white

        if version
          if Ruby.ruby_version_installed?(version)
            puts "Ruby #{version} is already installed. Skipping.".blue
          else
            system("rbenv install #{version}")
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

      def self.require_doctor!
        abort_install! unless doctor
      end

      def self.abort_install!
        puts 'Warning rbenv-doctor returned a non zero exit status.'.yellow
        puts 'Correct the error above before continuing.'.yellow
        puts 'Try closing this window and restarting your shell session.'.yellow
        puts "\n"
        puts 'Rerun the installer with:'
        puts '$ bin/install'.cyan
        puts "\n"
        abort('Aborting install.'.red)
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
