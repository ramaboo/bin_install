# BinInstall

Simple DSL for creating install scripts.

It's used at [Deliv](https://www.deliv.co/) to increase developer happiness.

## Installation

Add this line to your application's Gemfile:

    gem 'bin_install'

## Usage

To create install scripts run:

    $ rails generate bin_install:install

Will create the following files:

  * `bin/install`
  * `bin/update`
  * `bin/kill`

# Bang! vs No-bang

Most methods in this library have a bang and no-bang version. The banged versions will halt all further execution. No-bang methods will only display the error output of the command but execution will continue.

## Modules

Commands are divided into modules:

#### Brew

Handles everything related to [Homebrew](https://brew.sh/).

Require [Homebrew](https://brew.sh/) before continuing:

    BinInstall::Brew.require! # Also runs BinInstall::Brew.update!

Update [Homebrew](https://brew.sh/):

    BinInstall::Brew.update # or
    BinInstall::Brew.update!

Install [Homebrew](https://brew.sh/) package:

    BinInstall::Brew.install('package') # or
    BinInstall::Brew.install!('package')

Upgrade [Homebrew](https://brew.sh/) package:

    BinInstall::Brew.upgrade('package') # or
    BinInstall::Brew.upgrade!('package')

Install or Upgrade with one command:

    BinInstall::Brew.install_or_upgrade('package') # or
    BinInstall::Brew.install_or_upgrade!('package')
