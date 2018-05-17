require 'bin_install/ruby_environment_manager/rbenv'
require 'bin_install/ruby_environment_manager/rvm'

module BinInstall
  module RubyEnvironmentManager
    def self.install
      if RubyEnvironmentManager::Rvm.installed?
        puts 'RVM is already installed. Skipping rbenv install.'.blue
        return
      end

      RubyEnvironmentManager::Rbenv.install
    end

    def self.install!
      if RubyEnvironmentManager::Rvm.installed?
        puts 'RVM is already installed. Skipping rbenv install.'.blue
        return
      end

      RubyEnvironmentManager::Rbenv.install!
    end
  end
end
