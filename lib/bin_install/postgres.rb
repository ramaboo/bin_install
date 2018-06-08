module BinInstall
  module Postgres
    def self.install
      puts 'Installing PostgreSQL...'.white
      Brew::Package.install_or_upgrade('postgresql')
    end

    def self.install!
      puts 'Installing PostgreSQL...'.white
      Brew::Package.install_or_upgrade!('postgresql')
    end

    def self.create_superuser(username = 'postgres')
      system("createuser --superuser #{username}")
    end

    def self.create_superuser!(username = 'postgres')
      BinInstall.system!("createuser --superuser #{username}")
    end

    def self.create_user(username = 'postgres')
      system("createuser #{username}")
    end

    def self.create_user!(username = 'postgres')
      BinInstall.system!("createuser #{username}")
    end
  end
end
