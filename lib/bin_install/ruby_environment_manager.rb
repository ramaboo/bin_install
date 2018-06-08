require 'bin_install/ruby_environment_manager/rbenv'
require 'bin_install/ruby_environment_manager/rvm'

module BinInstall
  module RubyEnvironmentManager
    def self.install
      if RubyEnvironmentManager::Rvm.installed?
        puts 'RVM is already installed. Skipping rbenv install.'.blue
      else
        RubyEnvironmentManager::Rbenv.install
      end

      install_ruby
    end

    def self.install!
      if RubyEnvironmentManager::Rvm.installed?
        puts 'RVM is already installed. Skipping rbenv install.'.blue
      else
        RubyEnvironmentManager::Rbenv.install!
      end

      install_ruby!
    end

    def self.install_ruby(version = nil)
      case find_environment_manager!
      when :rbenv then RubyEnvironmentManager::Rbenv.install_ruby(version)
      when :rvm then RubyEnvironmentManager::Rvm.install_ruby(version)
      end
    end

    def self.install_ruby!(version = nil)
      case find_environment_manager!
      when :rbenv then RubyEnvironmentManager::Rbenv.install_ruby(version)
      when :rvm then RubyEnvironmentManager::Rvm.install_ruby(version)
      end
    end

    def self.required_ruby_version
      Dir.chdir(Dir.pwd) { `cat .ruby-version` }
    end

    def self.ruby_version
      Dir.chdir(Dir.pwd) { `ruby --version` }
    end

    def self.ruby_version_installed?(version)
      ruby_version.start_with?("ruby #{version}")
    end

    def self.find_environment_manager
      return :rbenv if RubyEnvironmentManager::Rbenv.installed?
      return :rvm if RubyEnvironmentManager::Rvm.installed?
    end

    def self.find_environment_manager!
      find_environment_manager || abort('No Ruby environment manager found.')
    end
  end
end
