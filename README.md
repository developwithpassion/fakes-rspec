#developwithpassion_fakes-rspec

This is a library to aid in the usage of [developwithpassion_fakes](http://github.com/developwithpassion/developwithpassion_fakes) when using [RSpec](https://github.com/rspec/rspec). It adds a bunch of convienience methods and matchers to aid in the usage of the heavily AAA style isolation library.

##Installation
```bash
gem install developwithpassion_fakes-rspec
```
Or (preferably using bundler), in your gemfile:

```ruby
source "http://rubygems.org"
gem 'developwithpassion_fakes-rspec'
```

When you install the gem it will install the rspec gem also, so you will be immediately ready to go.

##Usage

##Creating a fake

###Using a let block
```ruby
describe "Some Feature" do
  let(:my_fake){fake}
end
```

###Inline
```ruby
describe "Some Feature" do
  it "should be able to create a fake" do
    item = fake
  end
end
```
##Configuring a fake with return values for calls

###Irrespective of arguments:
```ruby
it "should be able to setup a fakes return values" do
  the_fake = fake
  fake.stub(:hello).and_return("World")

  fake.hello.should == "World"
  fake.hello("There").should == "World"
end
```

###Caring about arguments:
```ruby
it "should be able to setup a fakes return values" do
  the_fake = fake
  fake.stub(:hello).with("There").and_return("World")
  fake.stub(:hello).with("You").and_return("Again")

  fake.stub(:hello).and_return("Does Not Matter") # when you use the catch_all, make sure that it is the last step used for a particular method (as above)

  fake.hello("There").should == "World"
  fake.hello("You").should == "Again"
  fake.hello.should == "Does Not Matter"
end
```

##Determining whether a call was made

One of the big strengths of this library compared to some of the other ruby isolation libraries is the ability to let you make assertions against the fake after the [subject] has run its code. The following examples demonstrate some typical usage scenarios:

###Irrespective of arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received(:hello) #true
end
```
###With a specific set of arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received(:hello,"World") #true
  fake.should have_received(:hello,"Other") #false
end
```
Remember, that because it is just a matcher, to negate the matcher you can use the should_not qualifier to do the opposite:

###Determine whether a call was not made with a specific set of arguments:
```ruby
it "should be able to determine if a call was not made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should_not have_received(:hello,"Other") #true
end
```

##Determining that a call was made a certain number of times

###Irrespective of arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received_occurences(once,:hello) #true
end
```

###Caring about arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received_occurences(once,:hello,"World") #true
  fake.should have_received_occurences(once,:hello,"Earth") #false
end
```

Remember, that because it is just a matcher, to negate the matcher you can use the should_not qualifier to do the opposite:

###Determine whether a call was not made a specific number of times with a specific set of arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should_not have_received_occurences(twice,:hello,"World") #true
  fake.should_not have_received_occurences(twice,:hello) #true
end
```

The first argument to have_received_occurences just needs to be an item that responds to the method: is_satisfied_by(count).

The library adds a couple of convenience factory methods to the ExampleGroup class,to create the match specifications:

* once
* twice
* at_least_once
* at_least_twice
* at_most_once
* at_most_twice
* at_least(times)
* at_most(times)
* exactly(times)
* occurs(match_block) - Where match_block is a proc/lambda that matches the signature lambda{|number| bool}

An example of using the occurs method would be as follows:

###Determine whether a call was made between a certain number of times
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")
  fake.hello("Again")

  fake.should have_received_occurences(occurs(|number| (1..3) === number),:hello) #true
end
```

##Contributing

Feel free to fork this codebase and submit any pull requests you think would be useful. When you submit a pull request, make sure to include an accompanying test for the feature.


[Develop With Passion®](http://www.developwithpassion.com)
