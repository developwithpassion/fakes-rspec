module RSpec
  module Fakes
    class Occurances
      class << self
        def from_block(the_block)
          return BlockCriteria.new(the_block)
        end
        def exact(times)
          return from_block(lambda{|occurances| return occurances == times})
        end
        def at_least(times)
          return from_block(lambda { |occurences| return occurences >= times})
        end
        def at_most(times)
          return from_block(lambda { |occurences| return occurences <= times})
        end
      end
    end
  end
end
