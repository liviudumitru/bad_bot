$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bad_bot/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bad_bot"
  s.version     = BadBot::VERSION
  s.authors     = ["Tiago Scolari"]
  s.email       = ["tscolari@gmail.com"]
  s.homepage    = "http://github.com/tscolari/bad_bot"
  s.summary     = "Get better ranking on search engines, by preventing bad stuff from being indexed."
  s.description = "Avoid bad keywords from being indexed by google and other robots."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "turnip"
  s.add_development_dependency "capybara"
  s.add_development_dependency "debugger"
  s.add_development_dependency "simplecov"
end
