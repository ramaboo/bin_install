require 'awesome_print'

require 'bin_install/brew'
require 'bin_install/node'
require 'bin_install/postgres'
require 'bin_install/rails'
require 'bin_install/version'

module BinInstall
  def self.system!(*args)
    system(*args) || abort("Command `#{args}` failed!".red)
  end

  def self.install_gems!
    puts 'Installing gems...'.white
    system!('gem install bundler --conservative')
    system!('bundle install')
  end
end
