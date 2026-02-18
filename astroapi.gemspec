# frozen_string_literal: true

require_relative 'lib/astroapi/version'

Gem::Specification.new do |spec|
  spec.name = 'astroapi'
  spec.version = Astroapi::VERSION
  spec.authors = ['Astrology API']
  spec.email = ['support@astrology-api.io']

  spec.summary = 'Ruby client for the Astrology API'
  spec.description = 'A comprehensive Ruby SDK for the Astrology API (api.astrology-api.io), providing ' \
                     'access to planetary positions, charts, horoscopes, analysis, and more.'
  spec.homepage = 'https://github.com/astro-api/astroapi-ruby'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/astro-api/astroapi-ruby/issues',
    'changelog_uri' => 'https://github.com/astro-api/astroapi-ruby/blob/main/CHANGELOG.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/astroapi',
    'homepage_uri' => spec.homepage,
    'source_code_uri' => 'https://github.com/astro-api/astroapi-ruby',
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir.glob('lib/**/*').select { |f| File.file?(f) }
  spec.require_paths = ['lib']

  # Runtime dependencies
  spec.add_dependency 'faraday', '~> 2.0'
  spec.add_dependency 'faraday-retry', '~> 2.0'

  # Development dependencies
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.12'
  spec.add_development_dependency 'rubocop', '~> 1.50'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.20'
  spec.add_development_dependency 'simplecov', '~> 0.22'
  spec.add_development_dependency 'webmock', '~> 3.18'
  spec.add_development_dependency 'yard', '~> 0.9'
end
