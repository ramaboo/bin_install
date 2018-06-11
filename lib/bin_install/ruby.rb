require 'bin_install/ruby/rbenv'
require 'bin_install/ruby/rvm'

module BinInstall
  module Ruby
    def self.required_ruby_version
      Dir.chdir(Dir.pwd) { `cat .ruby-version` }.chop
    end

    def self.ruby_version
      Dir.chdir(Dir.pwd) { `ruby --version` }
    end

    def self.ruby_version_installed?(version)
      ruby_version.start_with?("ruby #{version}")
    end
  end
end
