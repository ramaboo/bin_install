module BinInstall
  module Mysql
    def self.install
      puts 'Installing MySQL...'.white
      Brew.install_or_upgrade('mysql')
    end

    def self.install!
      puts 'Installing MySQL...'.white
      Brew.install_or_upgrade!('mysql')
    end
  end
end
