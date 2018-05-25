module BinInstall
  module Rails
    def self.db_setup
      puts 'Preparing database...'.white
      rails_or_rake('db:setup')
      rails_or_rake!('db:setup RAILS_ENV=test')
    end

    def self.db_setup!
      puts 'Preparing database...'.white
      rails_or_rake!('db:setup')
      rails_or_rake!('db:setup RAILS_ENV=test')
    end

    def self.db_migrate
      puts 'Migrating database...'.white
      rails_or_rake('db:migrate')
    end

    def self.db_migrate!
      puts 'Migrating database...'.white
      rails_or_rake!('db:migrate')
    end

    def self.clear
      puts 'Removing unnecessary files...'.white
      rails_or_rake('log:clear')
      rails_or_rake('tmp:clear')
    end

    def self.clear!
      puts 'Removing unnecessary files...'.white
      rails_or_rake!('log:clear')
      rails_or_rake!('tmp:clear')
    end

    def self.rails_or_rake(command)
      if rails5?
        system("bin/rails #{command}")
      else
        system("bin/rake #{command}")
      end
    end

    def self.rails_or_rake!(command)
      if rails5?
        BinInstall.system!("bin/rails #{command}")
      else
        BinInstall.system!("bin/rake #{command}")
      end
    end

    def self.rails5?
      true
      # FIX
      ::Rails::VERSION::MAJOR >= 5
    end
  end
end
