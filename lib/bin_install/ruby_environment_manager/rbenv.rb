module BinInstall
  module RubyEnvironmentManager
    module Rbevn
      def self.install
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade('rbenv')
        Brew.install_or_upgrade('ruby-build')
      end

      def self.install!
        puts 'Installing rbenv...'.white
        Brew.install_or_upgrade!('rbenv')
        Brew.install_or_upgrade!('ruby-build')
      end

      def self.installed?
        system('rbenv --version')
      end
    end
  end
end
