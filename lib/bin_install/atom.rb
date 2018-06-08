require 'bin_install/atom/package'

module BinInstall
  module Atom
    def self.install
      if installed?
        puts 'Atom already installed. Skipping.'.blue
      else
        Brew::Cask.install('atom')
      end
    end

    def self.install!
      if installed?
        puts 'Atom already installed. Skipping.'.blue
      else
        Brew::Cask.install!('atom')
      end
    end

    def self.ask
      return if installed?

      print 'Would you like to install Atom? [Y/n]: '
      install if Shell.default_yes?(gets.chomp)
    end

    def self.ask!
      print 'Would you like to install Atom? [Y/n]: '
      install! if Shell.default_yes?(gets.chomp)
    end

    def self.installed?
      Shell.executable_exists?('atom')
    end
  end
end
