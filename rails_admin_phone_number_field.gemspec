$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_phone_number_field/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_phone_number_field"
  s.version     = RailsAdminPhoneNumberField::VERSION
  s.authors     = ["James Coleman"]
  s.email       = ["jtc331@gmail.com"]
  s.homepage    = "https://github.com/jcoleman/rails_admin_phone_number_field"
  s.summary     = "Adds a auto-formatting phone number field to RailsAdmin."

  s.files = Dir["{app,config,db,lib,js}/**/*"] + ["LICENSE.txt", "Rakefile", "README.markdown"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "rails_admin", "~> 0.6.0"
  s.add_dependency "phony"
  s.add_dependency "phony_rails"
end
