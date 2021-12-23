require "bundler/gem_tasks"
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |test|
  test.libs << 'lib'
  test.libs << 'test'
  test.test_files = Dir['test/**/*_test.rb']
  test.warning = false
  # test.verbose = true
end
