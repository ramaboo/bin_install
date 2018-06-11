module BinInstall
  module Git
    def self.install
      puts 'Installing Git...'.white
      Brew::Package.install_or_upgrade('git')
    end

    def self.install!
      puts 'Installing Git...'.white
      Brew::Package.install_or_upgrade!('git')
    end

    def self.add_remote(name, url)
      if remote?(name)
        puts "Remote #{name} already exists. Skipping remote #{name}.".blue
      else
        puts "Adding remote #{name} for #{url}...".white
        system("git remote add #{name} #{url}")
      end
    end

    def self.add_remote!(name, url)
      if remote?(name)
        puts "Remote #{name} already exists. Skipping remote #{name}.".blue
      else
        puts "Adding remote #{name} for #{url}...".white
        BinInstall.system!("git remote add #{name} #{url}")
      end
    end

    def self.remote?(name)
      system("git remote get-url #{name}")
    end

    def self.installed?
      Shell.executable_exists?('git')
    end
  end
end
