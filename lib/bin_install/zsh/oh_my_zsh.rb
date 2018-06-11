module BinInstall
  module Zsh
    module OhMyZsh
      INSTALL = %(sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)").freeze
      def self.require!
        abort('Oh My Zsh is required. Visit http://ohmyz.sh/ to install.'.red) unless installed?
      end

      def self.install
        puts 'Installing Oh My Zsh...'.white
        print_reload_warning
        if continue?
          system(INSTALL)
        else
          abort('Oh My Zsh installation aborted by user.'.red)
        end
      end

      def self.install!
        puts 'Installing Oh My Zsh...'.white
        print_reload_warning
        if continue?
          BinInstall.system!(INSTALL)
        else
          abort('Oh My Zsh installation aborted by user.'.red)
        end
      end

      def self.print_reload_warning
        return if installed?
        puts 'Warning Oh My Zsh requires reloading the shell.'.yellow
        puts 'After Oh My Zsh finishes installing.'.red
        puts "\n"
        puts 'Rerun the installer with:'
        puts '$ bin/install'.cyan
      end

      def self.continue?
        return true if installed?
        print 'Would you like to continue? [Y/n]: '
        Shell.default_yes?(gets.chomp)
      end

      def self.installed?
        File.exist?(File.expand_path('~/.oh-my-zsh'))
      end
    end
  end
end
