# -- this is magic line that ensures "../lib" is in the load path -------------
$:.push File.expand_path("../lib", __FILE__)

require 'stellae/version'

Gem::Specification.new do |s|
  s.name        = 'stellae'
  s.version     = Stellae::VERSION
  s.date        = '2015-04-24'
  s.summary     = "Ruby library for interacting with Stellae's web services"
  s.description = "Ruby library for interacting with Stellae's web services"
  s.authors     = ['Quinton Harris']
  s.email       = 'quinton@totokaelo.com'
  s.homepage    = 'http://github.com/totokaelo/stellae'
  s.license     = 'MIT'

  # -- these lines are worth some study ---------------------------------------
  # s.files: The files included in the gem. This clever use of git ls-files
  #          ensures that any files tracked in the git repo will be included.
  s.files         = `git ls-files`.split("\n")

  # s.test_files: Files that are used for testing the gem. This line cleverly
  #               supports TestUnit, MiniTest, RSpec, and Cucumber
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  # s.executables: Where any executable files included with the gem live.
  #                These go in bin by convention.
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  # s.require_paths: Directories within the gem that need to be loaded in order
  #                  to load the gem.
  s.require_paths = ['lib']

  # Dependencies
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'guard-rspec', '~> 4'
  s.add_development_dependency 'factory_girl'

  s.add_runtime_dependency 'savon', '~> 2.10.0'
end
