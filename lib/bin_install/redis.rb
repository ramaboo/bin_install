module BinInstall
  module Redis
    def self.install
      puts 'Installing Redis...'.white
      Brew.install_or_upgrade('redis')
    end

    def self.install!
      puts 'Installing Redis...'.white
      Brew.install_or_upgrade!('redis')
    end
  end
end
