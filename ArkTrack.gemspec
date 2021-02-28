# frozen_string_literal: true

require_relative "./lib/ArkTrack/version"

Gem::Specification.new do |spec|
  spec.name          = "ArkTrack"
  spec.version       = ArkTrack::VERSION
  spec.authors       = ["Jordan Reed"]
  spec.email         = ["crasinator@gmail.com"]
  spec.licenses      = ['MIT']
  spec.summary       = "Info on intraday trading for the Ark Investment Trading Desk"
  spec.homepage      = "https://github.com/crasinator/Ark/"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.files = Dir['lib/**/*']
  spec.bindir        = "bin"
  spec.executables   = "ArkTrack"
  spec.require_paths = ["lib"]

  spec.add_dependency  'rubygems'
  spec.add_dependency  'roo'
  spec.add_dependency  'httparty'
  spec.add_dependency  'date'
  spec.add_dependency  'json'

end
