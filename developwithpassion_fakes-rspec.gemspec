# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib",__FILE__)
require "core/version"

Gem::Specification.new do |s|
  s.name        = "developwithpassion_fakes-rspec"
  s.version     = DevelopWithPassion::Fakes::RSpec::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Develop With Passion®"]
  s.email       = ["open_source@developwithpassion.com"]
  s.homepage    = "http://www.developwithpassion.com"
  s.summary     = %q{Utility functions for develowithpassion_fakes when working with rSpec}
  s.description = %q{Faking library that allows inspection of received calls after they have been made. Also supports tracking calls with multiple argument sets.}
  s.rubyforge_project = "developwithpassion_fakes-rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "developwithpassion_fakes"
  s.add_runtime_dependency "rspec-core"
  s.add_runtime_dependency "rspec-expectations"
end
