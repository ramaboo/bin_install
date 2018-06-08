module BinInstall
  module Gem
    def self.install
      puts 'Installing gems...'.white
      system('gem install bundler --conservative')
      system('bundle install')
    end

    def self.install!
      puts 'Installing gems...'.white
      BinInstall.system!('gem install bundler --conservative')
      BinInstall.system!('bundle install')
    end

    def self.installed?
      Shell.executable_exists?('gem')
    end
  end
end
