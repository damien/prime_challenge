require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.pattern = 'test/*'
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.formatters = %w(clang)
  t.fail_on_error = true
end

task default: %i(rubocop test)
