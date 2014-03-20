require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'

desc "Validate ruby files in lib."
task :validate do
  Dir['lib/**/*.rb'].each do |lib_file|
    sh "ruby -c #{lib_file}"
  end
end

desc "Run validate and spec tests."
task :test => [
    :validate,
    :spec,
]