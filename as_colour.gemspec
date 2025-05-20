# frozen_string_literal: true

$LOAD_PATH.unshift(::File.join(::File.dirname(__FILE__), 'lib'))

require_relative 'lib/as_colour/version'

Gem::Specification.new do |spec|
  spec.name          = 'as_colour'
  spec.version       = AsColour::VERSION
  spec.authors       = ['Wes Hays']
  spec.email         = ['weshays@gmail.com']

  spec.summary       = 'Ruby API wrapper for the ASColour.com API'
  spec.description   = 'Ruby API wrapper for the ASColour.com API'
  spec.homepage      = 'https://github.com/BenefitMany/as_colour'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['source_code_uri'] = 'https://github.com/BenefitMany/as_colour'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/BenefitMany/as_colour/issues'
  spec.metadata['changelog_uri'] = 'https://github.com/BenefitMany/as_colour/blob/main/CHANGELOG.md'
  spec.metadata['documentation_uri'] = 'https://github.com/BenefitMany/as_colour/blob/main/as_colour_api.pdf'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'typhoeus', '~> 1.4'
  spec.add_dependency 'json', '~> 2.12'
  spec.add_dependency 'plissken', '~> 3.0'
  spec.add_dependency 'awrence', '~> 3.0'
  spec.add_dependency 'ostruct', '~> 0.6.1'
end
