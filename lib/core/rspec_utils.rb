module RSpec
  def self.create_received_criteria_from(the_call)
    return DevelopWithPassion::Fakes::RSpec::ReceivedCriteria.new(the_call)
  end
  def self.create_received_occurences_criteria_from(the_call,occurence)
    return DevelopWithPassion::Fakes::RSpec::ReceivedOccurencesCriteria.new(create_received_criteria_from(the_call),the_call,occurence)
  end

  Matchers.define :have_received do|symbol,*args|
    match do|the_fake|
      RSpec.create_received_criteria_from(the_fake.received(symbol)).is_satisfied_by(*args)
    end
  end
  Matchers.define :have_received_occurences do|occurence,symbol,*args|
    match do|the_fake|
      RSpec.create_received_occurences_criteria_from(the_fake.received(symbol),occurence).is_satisfied_by(*args)
    end
  end

end
