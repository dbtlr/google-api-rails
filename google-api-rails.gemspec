$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "google_api/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "google-api-rails"
  s.version     = GoogleApi::Rails::VERSION
  s.authors     = ["dbtlr"]
  s.email       = ["hi@dbtlr.com"]
  s.homepage    = "http://dbtlr.com"
  s.summary     = "This gem is a Rails interface for the official Google API gem."
  s.description = "This gem is a Rails interface for the official Google API gem."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activesupport", ">= 3.1.0"
  s.add_dependency "i18n"
  s.add_dependency "google-api-client"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", ">= 2.0.0"

end