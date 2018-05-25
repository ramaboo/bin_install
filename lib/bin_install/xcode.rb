module BinInstall
  module Xcode
    def self.install
      system('xcode-select --install')
    end

    def self.install!
      BinInstall.system!('xcode-select --install')
    end
  end
end
