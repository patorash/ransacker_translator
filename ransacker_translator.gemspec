# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ransacker_translator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "ransacker_translator"
  spec.version     = RansackerTranslator::VERSION
  spec.authors     = ["patorash"]
  spec.email       = ["chariderpato@gmail.com"]
  spec.homepage    = "https://github.com/patorash/ransacker_translator"
  spec.summary     = "expand search by ransack"
  spec.description = "expand search by ransack"
  spec.license     = "MIT"

  # s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  spec.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  # s.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency "ransack"

  spec.add_development_dependency "sqlite3", '~> 1.0'
  spec.add_development_dependency "rspec-rails", "~> 3.0"
  spec.add_development_dependency 'combustion', '~> 1.3'
  spec.add_development_dependency 'pry', '~> 0'
  spec.add_development_dependency 'database_cleaner', '~> 1.7'
  spec.add_development_dependency 'rspec_junit_formatter', '~> 0.4.1'
end
