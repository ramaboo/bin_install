module BinInstall
  module Redis
    def self.install
      puts 'Installing Redis...'.white
      Brew::Package.install_or_upgrade('redis')
    end

    def self.install!
      puts 'Installing Redis...'.white
      Brew::Package.install_or_upgrade!('redis')
    end

    def self.installed?
      Shell.executable_exists?('redis-server')
    end
  end
end
