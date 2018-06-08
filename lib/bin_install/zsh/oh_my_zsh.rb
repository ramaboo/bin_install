module BinInstall
  module Zsh
    module OhMyZsh
      def self.require!
        abort('Oh My Zsh is required. Visit http://ohmyz.sh/ to install.'.red) unless installed?
      end

      def self.install
        puts 'Installing Oh My Zsh...'.white
        system(%(sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"))
      end

      def self.install!
        puts 'Installing Oh My Zsh...'.white
        BinInstall.system!(%(sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"))
      end

      def self.installed?
        File.exist?(File.expand_path('~/.oh-my-zsh'))
      end
    end
  end
end
