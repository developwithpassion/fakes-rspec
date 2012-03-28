module RSpec
  def self.create_received_criteria_from(the_call)
    return Fakes::RSpec::ReceivedCriteria.new(the_call)
  end
  def self.create_received_occurences_criteria_from(the_call,occurence)
    return Fakes::RSpec::ReceivedOccurencesCriteria.new(create_received_criteria_from(the_call),the_call,occurence)
  end

  Matchers.define :have_received do|symbol,*args|
    @occurence_spec = Fakes::RSpec::NulloSpecification.instance

    chain :once do
      @occurence_spec = Fakes::RSpec::Occurances.exact(1)
    end
    chain :twice do
      @occurence_spec = Fakes::RSpec::Occurances.exact(2)
    end
    chain :at_least_once do
      @occurence_spec = Fakes::RSpec::Occurances.at_least(1)
    end
    chain :at_least_twice do
      @occurence_spec = Fakes::RSpec::Occurances.at_least(2)
    end
    chain :at_most_once do
      @occurence_spec = Fakes::RSpec::Occurances.at_most(1)
    end
    chain :at_most_twice do
      @occurence_spec = Fakes::RSpec::Occurances.at_most(2)
    end
    chain :at_least do|times|
      @occurence_spec =  Fakes::RSpec::Occurances.at_least(times)
    end
    chain :at_most do|times|
      @occurence_spec =  Fakes::RSpec::Occurances.at_most(times)
    end
    chain :exactly do|times|
      @occurence_spec = Fakes::RSpec::Occurances.exact(times)
    end
    chain :occurs do|the_proc|
      @occurence_spec = Fakes::RSpec::Occurances.from_block(the_proc)
    end
    match do|the_fake|
      RSpec.create_received_occurences_criteria_from(the_fake.received(symbol),@occurence_spec).is_satisfied_by(*args)
    end
  end
end
