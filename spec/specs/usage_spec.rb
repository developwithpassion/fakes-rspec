require 'spec_helper'

describe "using the rspec extensions" do
  it "should be able to determine if a call has not been made" do
    item = fake
    item.hello
    item.last("other")

    item.should_not have_received(:hello,"world")
    item.should have_received(:hello)
    item.should_not have_received(:once_more)
    item.should_not have_received(:last,"hello")
    item.should have_received(:last,"other")
  end

  it "should be able to determine if a call has been made a certain number of times" do
    item = fake
    item.hello
    item.hello
    item.last("other")

    item.should_not have_received(:hello,"world")
    item.should have_received_occurences(twice,:hello)
    item.should have_received(:hello)
    item.should_not have_received(:once_more)
    item.should_not have_received(:last,"hello")
    item.should have_received_occurences(once,:last,"other")
    item.should_not have_received_occurences(twice,:last)
  end
end

