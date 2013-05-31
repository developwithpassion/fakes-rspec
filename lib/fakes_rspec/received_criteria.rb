module Fakes
  module RSpec
    class ReceivedCriteria
      def initialize(the_call)
        @the_call = the_call
      end

      def is_satisfied_by(*args)
        return false if @the_call == nil
        return args.count == 0 ? true : @the_call.called_with(*args) != nil
      end
    end
  end
end
