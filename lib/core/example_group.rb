module RSpec
  module Core
    class ExampleGroup
      def once
        return DevelopWithPassion::Fakes::RSpec::Occurances.exact(1)
      end
      def twice
        return DevelopWithPassion::Fakes::RSpec::Occurances.exact(2)
      end
      def at_least_once
        return DevelopWithPassion::Fakes::RSpec::Occurances.at_least(1)
      end
      def at_least_twice
        return DevelopWithPassion::Fakes::RSpec::Occurances.at_least(2)
      end
      def at_most_once
        return DevelopWithPassion::Fakes::RSpec::Occurances.at_most(1)
      end
      def at_most_twice
        return DevelopWithPassion::Fakes::RSpec::Occurances.at_most(2)
      end
      def at_least(times)
        return DevelopWithPassion::Fakes::RSpec::Occurances.at_least(times)
      end
      def at_most(times)
        return DevelopWithPassion::Fakes::RSpec::Occurances.at_most(times)
      end
      def exactly(times)
        return DevelopWithPassion::Fakes::RSpec::Occurances.exact(times)
      end
    end
  end
end
