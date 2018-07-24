require 'cucumber'
require 'cucumber/rake/task'

task :run_demo_test do |t|
  cucumber_options = "--format pretty --format html -o reports/test_report.html"
  run_cucumber(cucumber_options)
end

def run_cucumber(cucumber_options)
  Cucumber::Rake::Task.new do |t|
    t.cucumber_opts = cucumber_options
  end
  Rake::Task[:cucumber].invoke
end
