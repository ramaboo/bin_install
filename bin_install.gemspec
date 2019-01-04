lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bin_install/version'

Gem::Specification.new do |spec|
  spec.name          = 'bin_install'
  spec.version       = BinInstall::VERSION
  spec.author        = 'David Singer'
  spec.email         = 'david@ramaboo.com'

  spec.summary       = 'Simple DSL for creating install scripts.'
  spec.description   = 'Create install scripts without the complexity of shell commands.'
  spec.homepage      = 'https://github.com/ramaboo/bin_install'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'awesome_print', '~> 1.8'

  spec.add_development_dependency 'bundler', '>= 2'
  spec.add_development_dependency 'pry', '~> 0.11'
  spec.add_development_dependency 'rake', '~> 12'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rubocop', '~> 0.56.0'
end
