module BinInstall
  module Atom
    # https://atom.io/packages/list?direction=desc&sort=downloads
    COMMON_PACKAGES = %w(file-icons minimap atom-beautify linter linter-ui-default pigments git-plus language-babel busy-signal linter-eslint react)

    def self.install
      if Shell.executable_exists?('atom')
        puts 'Atom already found. Skipping.'.blue
      else
        Brew::Cask.install_package('atom')
      end
    end

    def self.install!
      if Shell.executable_exists?('atom')
        puts 'Atom already found. Skipping.'.blue
      else
        Brew::Cask.install_package!('atom')
      end
    end

    def self.ask
      print 'Would you like to install Atom? [Y/n]: '
      install if Shell.default_yes?(gets.chomp)
    end

    def self.ask!
      print 'Would you like to install Atom? [Y/n]: '
      install! if Shell.default_yes?(gets.chomp)
    end

    def self.ask_install_common_packages
      print 'Would you like to install common packages for Atom? [Y/n]: '
      install_common_packages if Shell.default_yes?(gets.chomp)
    end

    def self.ask_install_common_packages!
      print 'Would you like to install common packages for Atom? [Y/n]: '
      install_common_packages! if Shell.default_yes?(gets.chomp)
    end

    def self.install_common_packages
      puts 'Installing common Atom packages...'.white
      COMMON_PACKAGES.each { |p| install_package(p) }
    end

    def self.install_common_packages!
      puts 'Installing common Atom packages...'.white
      COMMON_PACKAGES.each { |p| install_package!(p) }
    end

    def self.install_package(package)
      system("apm install #{package}")
    end

    def self.install_package!(package)
      BinInstall.system!("apm install #{package}")
    end
  end
end
