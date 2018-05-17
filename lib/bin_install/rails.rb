module BinInstall
  module Rails
    def self.db_setup
      puts 'Preparing database...'.white
      system('bin/rails db:setup')
    end

    def self.db_setup!
      puts 'Preparing database...'.white
      BinInstall.system!('bin/rails db:setup')
    end

    def self.db_migrate
      puts 'Migrating database...'.white
      system('bin/rails db:migrate')
    end

    def self.db_migrate!
      puts 'Migrating database...'.white
      BinInstall.system!('bin/rails db:migrate')
    end

    def self.clear
      puts 'Removing unnecessary files...'.white
      system('bin/rails log:clear tmp:clear')
    end

    def self.clear
      puts 'Removing unnecessary files...'.white
      BinInstall.system!('bin/rails log:clear tmp:clear')
    end
  end
end
