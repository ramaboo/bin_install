module BinInstall
  module Brew
    module Cask
      def self.install(package)
        system("brew cask install #{package}")
      end

      def self.install!(package)
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
