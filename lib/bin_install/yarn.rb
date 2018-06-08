module BinInstall
  module Yarn
    def self.install
      system('bin/yarn install')
    end

    def self.install!
      BinInstall.system!('bin/yarn install')
    end

    def self.upgrade
      system('bin/yarn upgrade')
    end

    def self.upgrade!
      BinInstall.system!('bin/yarn upgrade')
    end
  end
end
