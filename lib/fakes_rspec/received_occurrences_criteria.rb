module Fakes
  module RSpec
    class ReceivedOccurrencesCriteria
      def initialize(received_criteria,the_call,occurrence)
        @received_criteria = received_criteria
        @the_call = the_call
        @occurrence = occurrence
      end

      def is_satisfied_by(*args)
        return @received_criteria.is_satisfied_by(*args) &&
          @occurrence.is_satisfied_by((args.count == 0 ? @the_call.total_times_called : @the_call.called_with(*args).times_called))
      end
    end
  end
end
