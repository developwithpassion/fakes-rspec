require 'fakes'
require 'rspec'
require 'singleton'

require 'fakes_rspec/block_criteria'
require 'fakes_rspec/matcher'
require 'fakes_rspec/nullo_specification'
require 'fakes_rspec/occurrences'
require 'fakes_rspec/received_occurrences_criteria'
require 'fakes_rspec/received_criteria'

RSpec.configure do |config|
  config.after(:each) do
    reset_fake_classes
  end
end
