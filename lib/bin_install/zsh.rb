require 'bin_install/zsh/oh_my_zsh'

module BinInstall
  module Zsh
    def self.require!
      abort('Zsh is required. Visit http://www.zsh.org/ to install.'.red) unless installed?
    end

    def self.install
      puts 'Installing Zsh...'.white
      Brew::Package.install_or_upgrade('zsh')
    end

    def self.install!
      puts 'Installing Zsh...'.white
      Brew::Package.install_or_upgrade('zsh')
    end

    def self.installed?
      Shell.executable_exists?('zsh')
    end
  end
end
