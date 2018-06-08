require 'bin_install/brew/cask'
require 'bin_install/brew/service'

module BinInstall
  module Brew
    def self.require!
      if installed?
        update!
      else
        puts 'Homebrew is required.'.red
        puts 'Visit https://brew.sh/ for more information.'
        ask!
        abort('Can not continue without Homebrew.'.red) unless installed?
      end
    end

    def self.install
      puts 'Installing Homebrew...'.white
      system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
    end

    def self.install!
      puts 'Installing Homebrew...'.white
      BinInstall.system!('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
    end

    def self.ask
      return if installed?

      print 'Would you like to install Homebrew? [Y/n]: '
      install if Shell.default_yes?(gets.chomp)
    end

    def self.ask!
      print 'Would you like to install Homebrew? [Y/n]: '
      install! if Shell.default_yes?(gets.chomp)
    end

    def self.update
      puts 'Updating Homebrew...'.white
      system('brew update')
      Cask.tap
    end

    def self.update!
      puts 'Updating Homebrew...'.white
      BinInstall.system!('brew update')
      Cask.tap!
    end

    def self.installed?
      Shell.executable_exists?('brew')
    end
  end
end
