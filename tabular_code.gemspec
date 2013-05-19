# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tabular_code/version'

Gem::Specification.new do |gem|
  gem.name          = "tabular_code"
  gem.version       = TabularCode::VERSION
  gem.authors       = ["Zejun Wu"]
  gem.email         = ["zejun.wu@gmail.com"]
  gem.description   = %q{Convertion for tabular codes like Chinese quwei and Japanese kuten}
  gem.summary       = %q{Convertion for tabular codes like quwei and kuten}
  gem.homepage      = "https://github.com/watashi/tabular_code"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
