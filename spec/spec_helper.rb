require 'stellae'
require 'factory_girl'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  # Add some convenience helper methods
  require 'stellae_spec_helper'
  config.include StellaeSpecHelper

  # Add FactoryGirl
  config.include FactoryGirl::Syntax::Methods

  # Getting "factory not registered" without this, so...
  # http://stackoverflow.com/questions/24078768/argumenterror-factory-not-registered
  FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]
  FactoryGirl.find_definitions
end
