
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bin_install/version'

Gem::Specification.new do |spec|
  spec.name          = 'bin_install'
  spec.version       = BinInstall::VERSION
  spec.author       = 'David Singer'
  spec.email         = 'david@ramaboo.com'

  spec.summary       = 'A DSL for writing install scripts.'
  spec.description   = 'A DSL for writing install scripts.'
  spec.homepage      = 'https://github.com/ramaboo/bin_install'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'pry'
end
