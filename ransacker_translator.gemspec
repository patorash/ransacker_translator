$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ransacker_translator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ransacker_translator"
  s.version     = RansackerTranslator::VERSION
  s.authors     = ["Toyoaki Oko"]
  s.email       = ["chariderpato@gmail.com"]
  s.homepage    = "https://github.com/patorash/ransacker_translator"
  s.summary     = "expand search by ransack"
  s.description = "expand search by ransack"
  s.license     = "MIT"

  # s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  # s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']


  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "ransack"

  s.add_development_dependency "sqlite3"
end
