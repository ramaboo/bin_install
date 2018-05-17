module BinInstall
  module Postgres
    def self.install
      puts 'Installing PostgreSQL...'.white
      Brew.install_or_upgrade('postgresql')
      create_default_user
    end

    def self.install!
      puts 'Installing PostgreSQL...'.white
      Brew.install_or_upgrade!('postgresql')
      create_default_user!
    end

    def self.create_default_user
      system('createuser -s postgres')
    end

    def self.create_default_user!
      BinInstall.system!('createuser -s postgres')
    end
  end
end
