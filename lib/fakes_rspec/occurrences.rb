module Fakes
  module RSpec
    class Occurrences
      class << self
        def from_block(the_block)
          return BlockCriteria.new(the_block)
        end

        def exact(times)
          condition =  lambda { |occurances| occurances == times }

          return from_block(condition)
        end

        def at_least(times)
          condition = lambda { |occurrences| occurrences >= times }

          return from_block(condition)
        end

        def at_most(times)
          condition = lambda { |occurrences| occurrences <= times }

          return from_block(condition)
        end
      end
    end
  end
end
