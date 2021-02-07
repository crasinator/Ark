# frozen_string_literal: true

require_relative "lib/ArkTrack/version"

Gem::Specification.new do |spec|
  spec.name          = "ArkTrack"
  spec.version       = ArkTrack::VERSION
  spec.authors       = ["Jordan Reed"]
  spec.email         = ["jordanreed03@gmail.com"]
  spec.licenses      = ['MIT']
  spec.summary       = "Info on intraday trading for the Ark Investment Trading Desk"
  spec.homepage      = "https://github.com/crasinator/Ark/"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"  

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/crasinator/Ark.git"
  spec.metadata["changelog_uri"] = "https://github.com/crasinator/Ark/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem"

  spec.add_dependency  'rubygems'
  spec.add_dependency  'roo'
  spec.add_dependency  'httparty'
  spec.add_dependency  'date'
  spec.add_dependency  'json'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
