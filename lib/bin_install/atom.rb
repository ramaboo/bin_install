module BinInstall
  module Atom
    # https://atom.io/packages/list?direction=desc&sort=downloads
    COMMON_PACKAGES = %w[file-icons minimap atom-beautify linter linter-ui-default pigments git-plus busy-signal linter-eslint react].freeze

    def self.install
      if installed?
        puts 'Atom already installed. Skipping.'.blue
      else
        Brew::Cask.install_package('atom')
      end
    end

    def self.install!
      if installed?
        puts 'Atom already installed. Skipping.'.blue
      else
        Brew::Cask.install_package!('atom')
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

    def self.ask_install_common_packages
      return unless installed?

      print 'Would you like to install common packages for Atom? [Y/n]: '
      install_common_packages if Shell.default_yes?(gets.chomp)
    end

    def self.ask_install_common_packages!
      print 'Would you like to install common packages for Atom? [Y/n]: '
      install_common_packages! if Shell.default_yes?(gets.chomp)
    end

    def self.install_common_packages
      return unless installed?

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

    def self.installed?
      Shell.executable_exists?('atom')
    end
  end
end
