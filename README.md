# BinInstall

Simple DSL for creating install scripts.

It's used at [Deliv](https://www.deliv.co/) to increase developer happiness.

## Installation

Add this line to your application's Gemfile:

    gem 'bin_install'

## Usage

To create install scripts run:

    $ rails generate bin_install:install

Will create the following files with some common defaults:

  * `bin/install`
  * `bin/update`
  * `bin/kill`

## Bang! vs No Bang

Most methods in this library have also have a bang version that will halt all further execution. No bang methods will only display the error output of the command but execution will continue.

### Atom

Install [Atom](https://atom.io/):

    BinInstall::Atom.install # or install!

Ask before installing [Atom](https://atom.io/):

    BinInstall::Atom.ask # or ask!

Ask before installing common [packages](https://atom.io/packages):

    BinInstall::Atom.ask_install_common_packages # or ask_install_common_packages!

### Brew

Require [Homebrew](https://brew.sh/) before continuing:

    BinInstall::Brew.require!

Update [Homebrew](https://brew.sh/):

    BinInstall::Brew.update # or update!

Install [Homebrew](https://brew.sh/) package:

    BinInstall::Brew::Package.install('package') # or install!('package')

Upgrade [Homebrew](https://brew.sh/) package:

    BinInstall::Brew::Package.upgrade('package') # upgrade!('package')

Install or Upgrade with one command:

    BinInstall::Brew::Package.install_or_upgrade('package') # or install_or_upgrade!('package')

### Gem

Install all [gems](https://rubygems.org/) with:

    BinInstall::Gem.install # or install!

### Git

Install [Git](https://git-scm.com/) with:

    BinInstall::Git.install # or install!

### Mysql

Install [MySQL](https://www.mysql.com/) with:

    BinInstall::Mysql.install # or install!

Create root user with blank password:

    BinInstall::Mysql.create_root # or create_root!

Create user with username and password:

   BinInstall::Mysql.create_user('username', 'password')

### Node

Install [Node.js](https://nodejs.org/en/) and [Yarn](https://yarnpkg.com/en/) with:

    BinInstall::Node.install # or install!

Install packages with:

    BinInstall::Node.yarn_install # or yarn_install!

Upgrade packages with:

    BinInstall::Node.yarn_upgrade # or yarn_upgrade!

### Postgres

Install [PostgreSQL](https://www.postgresql.org/) with:

    BinInstall::Postgres.install # or install!

Create a user with a username and blank password:

    BinInstall::Postgres.create_user('username') # or create_user!('username')

Create a superuser with a username and blank password:

    BinInstall::Postgres.create_superuser('username') # or create_superuser!('username')

### Rails

Setup database with:

    BinInstall::Rails.db_setup # or db_setup!

Migrate database with:

    BinInstall::Rails.db_migrate # db_migrate!

Clear log and tmp files:

    BinInstall::Rails.clear # or clear!

### Redis

Install [Redis](https://redis.io/) with:

    BinInstall::Redis.install # or install!

### RubyEnvironmentManager

Install [rbenv](https://github.com/rbenv/rbenv) unless [RVM](https://rvm.io/) is installed with:

    BinInstall::RubyEnvironmentManager.install # or install!

### Server

Forcefully kill the server with:

    BinInstall::Server.kill # or kill!

## Contributing

All pull requests must pass [RuboCop](https://github.com/bbatsov/rubocop).

# TODO

- [] GitHub SSH stuff
- [] Mysql dev stuff
- [] test brew install without root
