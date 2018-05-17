module BinInstall
  module RubyEnvironmentManager
    module Rvm
      def self.installed?
        system('rvm --version')
      end
    end
  end
end
