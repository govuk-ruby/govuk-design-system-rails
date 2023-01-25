$LOAD_PATH.push File.expand_path("lib", __dir__)

Gem::Specification.new do |s|
  s.name = "govuk-design-system-rails"
  s.version = "0.9.8"
  s.authors = %w[govuk-ruby]
  s.summary = "An implementation of the govuk-frontend macros in Ruby on Rails"
  s.homepage = "https://github.com/govuk-ruby/govuk-design-system-rails"
  s.metadata = {
    "bug_tracker_uri" => "https://github.com/govuk-ruby/govuk-design-system-rails/issues",
    "changelog_uri" => "https://github.com/govuk-ruby/govuk-design-system-rails/releases",
    "homepage_uri" => "https://github.com/govuk-ruby/govuk-design-system-rails",
    "source_code_uri" => "https://github.com/govuk-ruby/govuk-design-system-rails",
    "wiki_uri" => "https://github.com/govuk-ruby/govuk-design-system-rails/wiki"
  }
  s.test_files = Dir["spec/**/*"]
  s.required_ruby_version = ">= 2.7.0"

  s.add_development_dependency "compare-xml"
  s.add_development_dependency "nokogiri"
  s.add_development_dependency "rails", "~> 6.1.6", ">= 6.1.6.1"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "rubocop-govuk"
  s.add_development_dependency "rubocop-performance"
  s.add_development_dependency "rubocop-rspec"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "super_diff"
end
