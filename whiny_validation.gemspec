# -*- encoding: utf-8 -*-
require File.expand_path('../lib/whiny_validation/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Brian Morearty"]
  gem.email         = ["brian@morearty.org"]
  gem.description   = %q{When an ActiveRecord/ActiveModel model won't save because it's invalid, this gem writes the validation error messages to the log.}
  gem.summary       = %q{Write ActiveRecord/ActiveModel validation error messages to the log}
  gem.homepage      = "https://github.com/BMorearty/whiny_validation"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "whiny_validation"
  gem.require_paths = ["lib"]
  gem.version       = WhinyValidation::VERSION

  gem.add_dependency 'activesupport'
  gem.add_dependency 'activemodel'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'activerecord'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'pry-byebug'
end
