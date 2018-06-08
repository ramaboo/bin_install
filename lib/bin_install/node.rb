module BinInstall
  module Node
    def self.install
      Brew::Package.install_or_upgrade('node')
      Brew::Package.install_or_upgrade('yarn')
      Yarn.install
    end

    def self.install!
      Brew::Package.install_or_upgrade!('node')
      Brew::Package.install_or_upgrade!('yarn')
      Yarn.install!
    end
  end
end
