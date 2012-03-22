module RSpec
  Matchers.define :have_received do|symbol,*args|
    match do|the_fake|
      DevelopWithPassion::Fakes::RSpec::ReceivedCriteria.new(the_fake.received(symbol)).is_satified_by(*args)
    end
  end
end
