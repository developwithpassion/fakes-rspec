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
    item.should have_received(:hello).twice
    item.should have_received(:hello)
    item.should_not have_received(:once_more)
    item.should_not have_received(:last,"hello")
    item.should have_received(:last,"other").once
    item.should_not have_received(:last).twice
  end

  it "should be able to determine if a call was made once" do
    item = fake
    item.hello

    item.should have_received(:hello).once
  end

  it "should be able to determine if a call was made twice" do
    item = fake
    item.hello
    item.hello

    item.should have_received(:hello).twice
  end

  it "should be able to determine if a call was made at least once" do
    item = fake
    item.hello
    item.hello

    item.should have_received(:hello).at_least_once
  end

  it "should be able to determine if a call was made at least twice" do
    item = fake
    item.hello
    item.hello
    item.hello

    item.should have_received(:hello).at_least_twice
    item.should have_received(:hello).at_least_twice
  end
  
  
  it "should be able to determine if a call was made at most once" do
    item = fake
    item.hello
    item.goodbye
    item.goodbye

    item.should have_received(:hello).at_most_once
    item.should_not have_received(:goodbye).at_most_once
  end

  it "should be able to determine if a call was made at most twice" do
    item = fake
    item.hello
    item.goodbye
    item.goodbye
    item.goodbye

    item.should have_received(:hello).at_most_twice
    item.should_not have_received(:goodbye).at_most_twice
  end

  it "should be able to determine if a call was made at least a specified number of times" do
    item = fake
    item.hello
    item.goodbye
    item.goodbye
    item.goodbye

    item.should have_received(:hello).at_most(1)
    item.should_not have_received(:goodbye).at_most(1)
  end
end

