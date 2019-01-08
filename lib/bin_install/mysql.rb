module BinInstall
  module Mysql
    def self.install(version = nil)
      puts 'Installing MySQL...'.white
      if version
        Brew::Package.install_or_upgrade("mysql@#{version}")
      else
        Brew::Package.install_or_upgrade('mysql')
      end
      Brew::Service.start('mysql')
      Shell.wait(10) # Give MySQL time to spin up.
    end

    def self.install!(version = nil)
      puts 'Installing MySQL...'.white
      if version
        Brew::Package.install_or_upgrade!("mysql@#{version}")
      else
        Brew::Package.install_or_upgrade!('mysql')
      end
      Brew::Service.start!('mysql')
      Shell.wait(10) # Give MySQL time to spin up.
    end

    def self.create_root
      puts 'Creating root user for MySQL....'.white
      system("mysqladmin --user=root password ''")
    end

    def self.create_root!
      puts 'Creating root user for MySQL....'.white
      BinInstall.system!("mysqladmin --user=root password ''")
    end

    def self.create_user(username, password = nil)
      puts "Creating user #{username} for MySQL...".white
      system(%(mysql --user=root --execute="CREATE USER '#{username}'@'localhost' IDENTIFIED BY '#{password}';"))
      system(%(mysql --user=root --execute="GRANT ALL PRIVILEGES ON *.* TO '#{username}'@'localhost' WITH GRANT OPTION;"))
    end

    def self.create_user!(username, password = nil)
      puts "Creating user #{username} for MySQL...".white
      BinInstall.system!(%(mysql --user=root --execute="CREATE USER '#{username}'@'localhost' IDENTIFIED BY '#{password}';"))
      BinInstall.system!(%(mysql --user=root --execute="GRANT ALL PRIVILEGES ON *.* TO '#{username}'@'localhost' WITH GRANT OPTION;"))
    end

    def self.installed?
      Shell.executable_exists?('mysql')
    end
  end
end
