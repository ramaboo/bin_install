module BinInstall
  module Rails
    def self.db_create(environment = 'development')
      puts 'Creating database...'.white
      rails_or_rake("db:create RAILS_ENV=#{environment}")
    end

    def self.db_create!(environment = 'development')
      puts 'Creating database...'.white
      rails_or_rake!("db:create RAILS_ENV=#{environment}")
    end

    def self.db_migrate(environment = 'development')
      puts 'Migrating database...'.white
      rails_or_rake("db:migrate RAILS_ENV=#{environment}")
    end

    def self.db_migrate!(environment = 'development')
      puts 'Migrating database...'.white
      rails_or_rake!("db:migrate RAILS_ENV=#{environment}")
    end

    def self.db_reset(environment = 'development')
      puts 'Resetting database...'.white
      rails_or_rake("db:reset RAILS_ENV=#{environment}")
    end

    def self.db_reset!(environment = 'development')
      puts 'Resetting database...'.white
      rails_or_rake!("db:reset RAILS_ENV=#{environment}")
    end

    def self.db_setup(environment = 'development')
      puts 'Preparing database...'.white
      rails_or_rake("db:setup RAILS_ENV=#{environment}")
    end

    def self.db_setup!(environment = 'development')
      puts 'Preparing database...'.white
      rails_or_rake!("db:setup RAILS_ENV=#{environment}")
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
      require 'rails'
      ::Rails::VERSION::MAJOR >= 5
    rescue LoadError
      false
    end
  end
end
