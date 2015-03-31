require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.libs.push 'spec' # Add ./test directory to load path
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.formatters = %w(clang)
  t.fail_on_error = true
end

desc 'Start a Pry session after loading Prime, MultiplicationTable, and CLI'
task :console do
  require 'pry'
  $LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
  Pry.config.requires += %w(cli multiplication_table prime)
  Pry.start
end

task default: %i(rubocop test)
