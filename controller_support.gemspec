# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "controller_support/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "controller_support"
  s.version     = ControllerSupport::VERSION
  s.authors     = ["Yonatan Bergman"]
  s.email       = ["yonbergman@gmail.com"]
  s.homepage    = "https://github.com/yonbergman/controller_support"
  s.summary     = "An extension of ActiveSupport::Concern to create smart and beautiful controller mixins"
  s.description = "An extension of ActiveSupport::Concern to create smart and beautiful controller mixins"

  s.files         = `git ls-files`.split("\n")
  s.require_path  = "lib"
  s.test_files = Dir.glob('spec/lib/*_spec.rb')

  s.add_dependency "activesupport"
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
