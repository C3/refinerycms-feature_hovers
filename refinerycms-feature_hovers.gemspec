# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-feature_hovers'
  s.authors           = ['Peter Hollows']
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Feature Hovers extension for Refinery CMS'
  s.date              = '2012-10-11'
  s.summary           = 'Feature Hovers extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.8'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.8'
end
