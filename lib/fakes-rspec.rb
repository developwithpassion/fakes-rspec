require 'fakes'
require 'rspec'
require 'singleton'

require 'core/block_criteria'
require 'core/matcher'
require 'core/nullo_specification'
require 'core/occurances'
require 'core/received_occurances_criteria'
require 'core/received_criteria'

RSpec.configure do |config|
  config.after(:each) do
    reset_fake_classes
  end
end
