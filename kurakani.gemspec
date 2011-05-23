# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name = "kurakani"
  s.summary = "Insert Kurakani summary."
  s.description = "Insert Kurakani description."
  s.files = Dir["lib/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.version = "0.0.1"

  s.add_development_dependency "rspec-rails", "~> 2.5"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy", "0.3.7"
  s.add_development_dependency "database_cleaner", "~> 0.6.7"
end
