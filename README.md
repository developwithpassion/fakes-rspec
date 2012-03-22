#developwithpassion_fakes-rspec

This is a library to aid in the usage of [developwithpassion_fakes](http://github.com/developwithpassion/developwithpassion_fakes) when using [RSpec](https://github.com/rspec/rspec). It basically just adds the convienience matcher: have_received which you would use as follows:

```ruby
it "should be able to determine if a call was made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should have_received(:hello) #true
  fake.should have_received(:hello,"World") #true
  fake.should have_received(:hello,"Other") #false
end
```
Or conversely:

```ruby
it "should be able to determine if a call was never made on a fake" do
  the_fake = fake
  fake.hello("World")

  fake.should_not have_received(:goodbye) #true
  fake.should_not have_received(:hello,"Earth") #true
  fake.should_not have_received(:hello) #false
end
```

[Develop With Passion®](http://www.developwithpassion.com)
