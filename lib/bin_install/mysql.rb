module BinInstall
  module Mysql
    def self.install
      puts 'Installing MySQL...'.white
      Brew.install_or_upgrade('mysql')
      system('brew services start mysql')
    end

    def self.install!
      puts 'Installing MySQL...'.white
      Brew.install_or_upgrade!('mysql')
      BinInstall.system!('brew services start mysql')
    end

    def self.create_root
      system("mysqladmin --user=root password ''")
    end

    def self.create_root!
      BinInstall.system!("mysqladmin --user=root password ''")
    end

    def self.create_user(username, password = nil)
      system(%(mysql --user=root --execute="CREATE USER '#{username}'@'localhost' IDENTIFIED BY '#{password}';"))
      system(%(mysql --user=root --execute="GRANT ALL PRIVILEGES ON *.* TO '#{username}'@'localhost' WITH GRANT OPTION;"))
    end

    def self.create_user!(username, password = nil)
      BinInstall.system!(%(mysql --user=root --execute="CREATE USER '#{username}'@'localhost' IDENTIFIED BY '#{password}';"))
      BinInstall.system!(%(mysql --user=root --execute="GRANT ALL PRIVILEGES ON *.* TO '#{username}'@'localhost' WITH GRANT OPTION;"))
    end
  end
end