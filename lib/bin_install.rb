require 'awesome_print'

require 'bin_install/atom'
require 'bin_install/brew'
require 'bin_install/gem'
require 'bin_install/git'
require 'bin_install/mysql'
require 'bin_install/node'
require 'bin_install/postgres'
require 'bin_install/rails'
require 'bin_install/ruby_environment_manager'
require 'bin_install/server'
require 'bin_install/shell'
require 'bin_install/version'

module BinInstall
  def self.system!(*args)
    system(*args) || abort("Command `#{args}` failed!".red)
  end

  def app_name
    File.basename(Dir.pwd)
  end
end
