require 'spec_helper'

describe "using the rspec extensions" do
  it "should be able to determine if a call has not been made" do
    item = fake
    item.hello
    item.last("other")

    item.should_not have_received_message(:hello,"world")
    item.should have_received_message(:hello)
    item.should_not have_received_message(:once_more)
    item.should_not have_received_message(:last,"hello")
    item.should have_received_message(:last,"other")
  end

  it "should be able to determine if a call has been made a certain number of times" do
    item = fake
    item.hello
    item.hello
    item.last("other")

    item.should_not have_received_message(:hello,"world")
    item.should have_received_message(:hello).twice
    item.should have_received_message(:hello)
    item.should_not have_received_message(:once_more)
    item.should_not have_received_message(:last,"hello")
    item.should have_received_message(:last,"other").once
    item.should_not have_received_message(:last).twice
  end

  it "should be able to determine if a call was made once" do
    item = fake
    item.hello

    item.should have_received_message(:hello).once
  end

  it "should be able to determine if a call was made twice" do
    item = fake
    item.hello
    item.hello

    item.should have_received_message(:hello).twice
  end

  it "should be able to determine if a call was made at least once" do
    item = fake
    item.hello
    item.hello

    item.should have_received_message(:hello).at_least_once
  end

  it "should be able to determine if a call was made at least twice" do
    item = fake
    item.hello
    item.hello
    item.hello

    item.should have_received_message(:hello).at_least_twice
    item.should have_received_message(:hello).at_least_twice
  end
  
  
  it "should be able to determine if a call was made at most once" do
    item = fake
    item.hello
    item.goodbye
    item.goodbye

    item.should have_received_message(:hello).at_most_once
    item.should_not have_received_message(:goodbye).at_most_once
  end

  it "should be able to determine if a call was made at most twice" do
    item = fake
    item.hello
    item.goodbye
    item.goodbye
    item.goodbye

    item.should have_received_message(:hello).at_most_twice
    item.should_not have_received_message(:goodbye).at_most_twice
  end

  it "should be able to determine if a call was made at least a specified number of times" do
    item = fake
    item.hello
    item.goodbye
    item.goodbye
    item.goodbye

    item.should have_received_message(:hello).at_most(1)
    item.should_not have_received_message(:goodbye).at_most(1)
  end
  context "using the arg matching style" do
    it "should be able to determing if a call was made using arg matchers" do
      item = fake
      item.hello("Yes")

      item.should have_received_message(:hello,arg_match.any)
    end

    it "should be able to determing if a call was made using a combination of arg matchers and explicit values" do
      item = fake
      item.hello("Yes",2)

      item.should have_received_message(:hello,arg_match.regex(/Y/),2)
    end
  end
  context "using class swapping" do
    it "should be able to fake out behaviour of singleton methods" do
      fake_class Dir

      Dir.stub(:exist?).and_return false

      Dir.exist('/').should be_false
    end

    it "should be able to determing if a call was made using a combination of arg matchers and explicit values" do
      item = fake
      item.hello("Yes",2)

      item.should have_received_message(:hello,arg_match.regex(/Y/),2)
    end
  end
end

