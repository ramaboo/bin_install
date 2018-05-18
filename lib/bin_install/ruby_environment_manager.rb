require 'bin_install/ruby_environment_manager/rbenv'
require 'bin_install/ruby_environment_manager/rvm'

module BinInstall
  module RubyEnvironmentManager
    def self.install(version = nil)
      if RubyEnvironmentManager::Rvm.installed?
        puts 'RVM is already installed. Skipping rbenv install.'.blue
        RubyEnvironmentManager::Rvm.install_ruby(version)
        return
      end

      RubyEnvironmentManager::Rbenv.install(version)
    end

    def self.install!(version = nil)
      if RubyEnvironmentManager::Rvm.installed?
        puts 'RVM is already installed. Skipping rbenv install.'.blue
        RubyEnvironmentManager::Rvm.install_ruby!(version)
        return
      end

      RubyEnvironmentManager::Rbenv.install!(version)
    end

    def self.ruby_version
      Dir.chdir(Dir.pwd) { `cat .ruby-version` }
    end
  end
end
