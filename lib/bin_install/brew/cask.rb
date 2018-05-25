module BinInstall
  module Brew
    module Cask
      def self.install_package(package)
        system("brew cask install #{package}")
      end

      def self.install_package!(package)
        BinInstall.system!("brew cask install #{package}")
      end

      def self.tap
        system('brew tap caskroom/cask')
      end

      def self.tap!
        BinInstall.system!('brew tap caskroom/cask')
      end
    end
  end
end
