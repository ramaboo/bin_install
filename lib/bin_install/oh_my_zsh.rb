module BinInstall
  module OhMyZsh
    def self.require!
      abort('Oh My Zsh is required. Visit http://ohmyz.sh/ to install.'.red) unless installed?
    end

    def self.install
      puts 'Installing Oh My Zsh...'.white
      Brew::Package.install('zsh')
      Brew::Package.install('zsh-completions')
    end

    def self.install!
      puts 'Installing Oh My Zsh...'.white
      Brew::Package.install!('zsh')
      Brew::Package.install!('zsh-completions')
    end

    def self.installed?
      Shell.executable_exists?('zsh')
    end
  end
end
