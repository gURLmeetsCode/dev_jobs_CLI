require_relative './lib/dev_jobs/version'


Gem::Specification.new do |spec|
  spec.name          = "dev_jobs"
  spec.version       = DevJobs::VERSION
  spec.authors       = ["Natasha Kelly"]
  spec.email         = "kellynatashav@yahoo.com"
  spec.date          = "2017-05-31"
  spec.files         = ["lib/dev_jobs.rb", "lib/dev_jobs/COMMAND_LINE_INTERFACE.rb", "lib/dev_jobs/scraper.rb", "lib/dev_jobs/job.rb", "config/environment.rb"]
  spec.summary       = "Stackoverflow Bay Area Dev Jobs"
  spec.description   = "Provides the job title, job link and when it was posted on the website."
  spec.homepage      = 'https://github.com/gURLmeetsCode/dev_jobs_CLI.git'
  spec.license       = 'MIT'
  spec.executables   << 'dev_jobs'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"

end
