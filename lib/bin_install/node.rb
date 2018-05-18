module BinInstall
  module Node
    def self.install
      Brew.install_or_upgrade('node')
      Brew.install_or_upgrade('yarn')
      yarn_install
    end

    def self.install!
      Brew.install_or_upgrade!('node')
      Brew.install_or_upgrade!('yarn')
      yarn_install!
    end

    def self.yarn_install
      system('bin/yarn install')
    end

    def self.yarn_install!
      BinInstall.system!('bin/yarn install')
    end

    def self.yarn_upgrade
      system('bin/yarn upgrade')
    end

    def self.yarn_upgrade!
      BinInstall.system!('bin/yarn upgrade')
    end
  end
end
