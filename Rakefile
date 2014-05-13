#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/testtask'

task :default => :test
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = Dir.glob(File.dirname(__FILE__) + '/test/**/*_test.rb').sort
  t.warning = true
  t.verbose = true
end
