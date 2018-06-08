module BinInstall
  module Brew
    module Package
      # https://atom.io/packages/list?direction=desc&sort=downloads
      POPULAR_PACKAGES = %w[file-icons minimap atom-beautify linter linter-ui-default pigments git-plus busy-signal linter-eslint react].freeze

      def self.ask_popular
        return unless installed?

        print 'Would you like to install popular packages for Atom? [Y/n]: '
        install_popular if Shell.default_yes?(gets.chomp)
      end

      def self.ask_popular!
        print 'Would you like to install popular packages for Atom? [Y/n]: '
        install_popular! if Shell.default_yes?(gets.chomp)
      end

      def self.install_popular
        return unless installed?

        puts 'Installing popular Atom packages...'.white
        POPULAR_PACKAGES.each { |p| install(p) }
      end

      def self.install_popular!
        puts 'Installing popular Atom packages...'.white
        POPULAR_PACKAGES.each { |p| install!(p) }
      end

      def self.install(package)
        system("apm install #{package}")
      end

      def self.install!(package)
        BinInstall.system!("apm install #{package}")
      end

      def self.installed?
        Shell.executable_exists?('apm')
      end
    end
  end
end
