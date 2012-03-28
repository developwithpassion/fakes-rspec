module Fakes
  module RSpec
    class NulloSpecification
      include Singleton
      def is_satisfied_by(item)
        return true
      end
    end
  end
end
