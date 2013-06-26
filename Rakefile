require "rspec/core/rake_task"

desc "Run all test with spec"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
  t.pattern = 'spec/**/*_spec.rb'
end
desc "Run tests"
task :default => :spec