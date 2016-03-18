require 'rubygems'
begin
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end
rescue LoadError
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task :default => [ :spec, :features ] do
end
