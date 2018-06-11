module BinInstall
  module Ruby
    module Rvm
      INSTALL = '\curl -sSL https://get.rvm.io | bash'.freeze

      def self.install
        puts 'Installing RVM...'.white
        system(INSTALL)
        require_loaded!
        install_ruby
      end

      def self.install!
        puts 'Installing RVM...'.white
        BinInstall.system!(INSTALL)
        BinInstall.system!('source ~/.rvm/scripts/rvm')
        require_loaded!
        install_ruby!
      end

      def self.install_ruby(version = Ruby.required_ruby_version)
        puts "Installing Ruby #{version}...".white

        if version
          if Ruby.ruby_version_installed?(version)
            puts "Ruby #{version} is already installed. Skipping Ruby #{version} install.".blue
          else
            system("rvm install #{version}")
            system("rvm use #{version}")
          end
        else
          puts 'Unknown Ruby version. Create .ruby-version file.'
        end
      end

      def self.install_ruby!(version = Ruby.required_ruby_version)
        puts "Installing Ruby #{version}...".white

        if version
          if Ruby.ruby_version_installed?(version)
            puts "Ruby #{version} is already installed. Skipping Ruby #{version} install.".blue
          else
            BinInstall.system!("rvm install #{version}")
            BinInstall.system!("rvm use #{version}")
          end
        else
          abort('Unknown Ruby version. Create .ruby-version file.'.red)
        end
      end

      def self.require_loaded!
        abort_install! unless installed?
      end

      def self.abort_install!
        puts 'Warning RVM is not loaded.'.yellow
        puts 'Try closing this window and restarting your shell session.'.yellow
        puts "\n"
        puts 'Rerun the installer with:'
        puts '$ bin/install'.cyan
        puts "\n"
        abort('Aborting install.'.red)
      end

      def self.installed?
        Shell.executable_exists?('rvm')
      end
    end
  end
end
