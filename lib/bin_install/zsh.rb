require 'bin_install/zsh/oh_my_zsh'

module BinInstall
  module Zsh
    def self.require!
      abort('Zsh is required. Visit http://www.zsh.org/ to install.'.red) unless installed?
    end

    def self.install
      puts 'Installing Zsh...'.white
      print_reload_warning
      if continue?
        Brew::Package.install_or_upgrade('zsh')
        Brew::Package.install_or_upgrade('zsh-completions')
      else
        abort('Warning Zsh install stopped by user.'.red)
      end
    end

    def self.install!
      puts 'Installing Oh My Zsh...'.white
      print_reload_warning
      if continue?
        Brew::Package.install_or_upgrade('zsh')
        Brew::Package.install_or_upgrade('zsh-completions')
      else
        abort('Warning Zsh install stopped by user.'.red)
      end
    end

    def self.print_reload_warning
      puts 'Warning Zsh requires reloading the shell.'.yellow
      puts 'After Zsh finishes installing you may to rerun the installer with:'
      puts '$ gem install bin_install'.cyan
      puts '$ bin/install'.cyan
    end

    def self.continue?
      print 'Would you like to continue? [Y/n]: '
      Shell.default_yes?(gets.chomp)
    end

    def self.installed?
      Shell.executable_exists?('zsh')
    end
  end
end
