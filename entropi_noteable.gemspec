$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "entropi/noteable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "entropi_noteable"
  s.version     = EntropiNoteable::VERSION
  s.authors     = ["Nicholas W. Watson"]
  s.email       = ["nick@entropi.co"]
  s.homepage    = "https://github.com/entropillc/entropi_noteable"
  s.summary     = "Entropi Noteable is a small gem that allows you to add notes to a model"
  s.description = "Entropi Noteable is a small gem that allows you to add notes to a model"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'rspec-rails'

  if (RUBY_PLATFORM.eql?('java'))
    s.add_development_dependency 'activerecord-jdbcsqlite3-adapter'
  else
    s.add_development_dependency 'sqlite3', '~> 0.15.1'
  end
end
