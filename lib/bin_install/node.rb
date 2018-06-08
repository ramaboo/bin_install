module BinInstall
  module Node
    def self.install
      puts 'Installing Node.js...'.white
      Brew::Package.install_or_upgrade('node')
    end

    def self.install!
      puts 'Installing Node.js...'.white
      Brew::Package.install_or_upgrade!('node')
    end

    def self.installed?
      Shell.executable_exists?('node')
    end
  end
end
