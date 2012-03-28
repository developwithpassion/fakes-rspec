module RSpec
  module Fakes
    class ReceivedOccurencesCriteria
      def initialize(received_criteria,the_call,occurence)
        @received_criteria = received_criteria
        @the_call = the_call
        @occurence = occurence
      end

      def is_satisfied_by(*args)
        return @received_criteria.is_satisfied_by(*args) &&
          @occurence.is_satisfied_by((args.count == 0 ? @the_call.total_times_called : @the_call.called_with(*args).times_called))
      end
    end
  end
end
