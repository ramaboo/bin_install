module BinInstall
  module Yarn
    def self.install
      puts 'Installing Yarn...'.white
      Brew::Package.install_or_upgrade('yarn')
      system('yarn install')
    end

    def self.install!
      puts 'Installing Yarn...'.white
      Brew::Package.install_or_upgrade!('yarn')
      BinInstall.system!('yarn install')
    end

    def self.upgrade
      system('yarn upgrade')
    end

    def self.upgrade!
      BinInstall.system!('yarn upgrade')
    end

    def self.installed?
      Shell.executable_exists?('yarn')
    end
  end
end
