module BinInstall
  module OhMyZsh
    def self.require!
      abort('Oh My Zsh is required. Visit http://ohmyz.sh/ to install.'.red) unless installed?
    end

    def self.install
      puts 'Installing Oh My Zsh...'.white
      Brew::Package.install_or_upgrade('zsh')
      Brew::Package.install_or_upgrade('zsh-completions')
      system(%(sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"))
    end

    def self.install!
      puts 'Installing Oh My Zsh...'.white
      Brew::Package.install_or_upgrade!('zsh')
      Brew::Package.install_or_upgrade!('zsh-completions')
      BinInstall.system!(%(sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"))
    end

    def self.installed?
      Shell.executable_exists?('zsh')
    end
  end
end
