#developwithpassion_fakes-rspec

This is a library to aid in the usage of [developwithpassion_fakes](http://github.com/developwithpassion/developwithpassion_fakes) when using [RSpec](https://github.com/rspec/rspec). It "basically" just adds 2 convienience matcher methods: 

* have_received
* have_received_occurences 

##Determining whether a call was made

###Determine whether a call was made irrespective of arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received(:hello) #true
end
```
###Determine whether a call was made with a specific set of arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received(:hello,"World") #true
  fake.should have_received(:hello,"Other") #false
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
```ruby

###Caring about arguments:
```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received_occurences(once,:hello,"World") #true
  fake.should have_received_occurences(once,:hello,"Earth") #false
end
```ruby

The first argument to have_received_occurences just needs to be an item that responds to the method: is_satisfied_by(count).

The library adds the following convenience factory methods to the ExampleGroup class:

* once
* twice
* at_least_once
* at_least_twice
* at_most_once
* at_most_twice
* at_least(times)
* at_most(times)
* exactly(times)


[Develop With Passion®](http://www.developwithpassion.com)
