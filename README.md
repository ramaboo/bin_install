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

## Modules

Commands are divided into modules:

#### Brew

Handles everything related to [Homebrew](https://brew.sh/).

* Require [Homebrew](https://brew.sh/) before continuing.

    BinInstall::Brew.require!

* Update [Homebrew](https://brew.sh/).

    BinInstall::Brew.update!
