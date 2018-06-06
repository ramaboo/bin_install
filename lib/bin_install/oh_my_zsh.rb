module BinInstall
  module OhMyZsh
    def self.require!
      abort('Oh My Zsh is required. Visit http://ohmyz.sh/ to install.'.red) unless installed?
    end

    def self.install
      puts 'Installing Oh My Zsh...'.white
      system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
      puts 'h1'

      if loaded?
        puts 'loaded'
      else
        puts 'not loaded'
        puts 'restarting'
        system('zsh')
      end
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

    def self.loaded?
      puts 'moo'
      puts `echo $SHELL`
      puts 'foo'
      puts `echo $0`

      puts 'now system'
      system 'echo $SHELL'
      system 'echo $0'
      puts 'done'

      puts `zsh -c "echo $0"`
      `echo $0` == 'zsh'
    end
  end
end
