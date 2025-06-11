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
  spec.required_ruby_version = Gem::Requirement.new(">= 3.0.0")

  # s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  spec.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  # s.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency "activerecord", '< 7.2.0', '>= 6.1.0'
  spec.add_dependency "activesupport", '< 7.2.0', '>= 6.1.0'
  spec.add_dependency "actionview", '< 7.2.0', '>= 6.1.0'
  spec.add_dependency "railties", '< 7.2.0', '>= 6.1.0'
  spec.add_dependency "ransack", '>= 4.1.0'
  spec.add_dependency "pg", '~> 1.2'
  spec.add_dependency "nkf"

  spec.add_development_dependency 'pry', '~> 0.14'
  spec.add_development_dependency 'database_cleaner', '~> 2.1'
  spec.add_development_dependency "mutex_m"
  spec.add_development_dependency "bigdecimal"
  spec.add_development_dependency "base64"
  spec.add_development_dependency "drb"
  spec.add_development_dependency "concurrent-ruby", '1.3.4'
end
