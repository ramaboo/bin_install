require 'awesome_print'

require 'bin_install/atom'
require 'bin_install/brew'
require 'bin_install/gem'
require 'bin_install/git'
require 'bin_install/mysql'
require 'bin_install/node'
require 'bin_install/postgres'
require 'bin_install/rails'
require 'bin_install/redis'
require 'bin_install/ruby'
require 'bin_install/server'
require 'bin_install/shell'
require 'bin_install/version'
require 'bin_install/xcode'
require 'bin_install/yarn'
require 'bin_install/zsh'

module BinInstall
  def self.start
    puts "Starting bin_install #{VERSION}...".white
  end

  def self.finish
    puts "Finished bin_install #{VERSION}.".green
  end

  def self.system!(*args)
    system(*args) || abort("Command #{args} failed!".red)
  end

  def app_name
    File.basename(Dir.pwd)
  end
end
