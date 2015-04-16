# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib",__FILE__)
require "fakes_rspec/version"

Gem::Specification.new do |s|
  s.name        = "fakes-rspec"
  s.version     = Fakes::RSpec::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ["Develop With Passion®"]
  s.email       = ["open_source@developwithpassion.com"]
  s.homepage    = "http://www.developwithpassion.com"
  s.summary     = %q{Utility functions for develowithpassion_fakes when working with rSpec}
  s.description = %q{Faking library that allows inspection of received calls after they have been made. Also supports tracking calls with multiple argument sets.}
  s.rubyforge_project = "fakes-rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency('rake', "~> 0.9.0")
  s.add_development_dependency('guard', "~> 2.6.1")
  s.add_development_dependency('guard-rspec', "~> 4.2.9")
  s.add_runtime_dependency('fakes', "~> 1.1.4")
  s.add_runtime_dependency('rspec', "~> 3.0")
end
