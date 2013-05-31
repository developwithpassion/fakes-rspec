module Fakes
  module RSpec
    class BlockCriteria
      def initialize(condition_block)
        @condition_block = condition_block
      end
      def is_satisfied_by(item)
        return @condition_block.call(item)
      end
    end
  end
end
