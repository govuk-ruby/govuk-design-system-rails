$:.push File.expand_path("lib", __dir__)

Gem::Specification.new do |s|
  s.name        = "govuk-design-system-rails"
  s.version     = "0.7.6"
  s.authors     = %w(UKGovernmentBEIS)
  s.summary     = "An implementation of the govuk-frontend macros in Ruby on Rails"

  s.add_runtime_dependency "slim"
end
