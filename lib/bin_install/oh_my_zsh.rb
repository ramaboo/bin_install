module BinInstall
  module OhMyZsh
    def self.require!
      abort('Oh My Zsh is required. Visit http://ohmyz.sh/ to install.'.red) unless installed?
    end

    def self.install
      puts 'Installing Oh My Zsh...'.white
      system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
      puts 'h1'
      system('zsh')
      puts 'h2'
    end

    def self.install!
      puts 'Installing Oh My Zsh...'.white
      BinInstall.system!('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
      puts 'e1'
      BinInstall.system!('zsh')
      puts 'e2'
    end

    def self.installed?
      Shell.executable_exists?('zsh')
    end
  end
end
