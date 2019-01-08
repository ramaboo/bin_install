module BinInstall
  module Postgres
    def self.install(version = nil)
      puts 'Installing PostgreSQL...'.white
      if version
        Brew::Package.install_or_upgrade("postgresql@#{version}")
      else
        Brew::Package.install_or_upgrade('postgresql')
      end
    end

    def self.install!(version = nil)
      puts 'Installing PostgreSQL...'.white
      if version
        Brew::Package.install_or_upgrade!("postgresql@#{version}")
      else
        Brew::Package.install_or_upgrade!('postgresql')
      end
    end

    def self.create_superuser(username = 'postgres')
      puts 'Creating superuser postgres for postgresqlSQL...'.white
      system("createuser --superuser #{username}")
    end

    def self.create_superuser!(username = 'postgres')
      puts 'Creating superuser postgres for PostgreSQL...'.white
      BinInstall.system!("createuser --superuser #{username}")
    end

    def self.create_user(username = 'postgres')
      puts "Creating user #{username} for PostgreSQL".white
      system("createuser #{username}")
    end

    def self.create_user!(username = 'postgres')
      puts "Creating user #{username} for PostgreSQL".white
      BinInstall.system!("createuser #{username}")
    end

    def self.installed?
      Shell.executable_exists?('psql')
    end
  end
end
