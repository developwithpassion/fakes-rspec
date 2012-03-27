require 'spec_helper'

module RSpec
  module Core
    describe ExampleGroup do
      context "when creating occurence matchers" do
        it "should be able to create matchers correctly" do
          once.is_satisfied_by(1).should be_true
          once.is_satisfied_by(2).should be_false

          twice.is_satisfied_by(2).should be_true
          twice.is_satisfied_by(1).should be_false

          at_least_once.is_satisfied_by(1).should be_true
          at_least_once.is_satisfied_by(2).should be_true
          at_least_once.is_satisfied_by(0).should be_false

          at_least_twice.is_satisfied_by(2).should be_true
          at_least_twice.is_satisfied_by(3).should be_true
          at_least_twice.is_satisfied_by(0).should be_false

          at_most_once.is_satisfied_by(1).should be_true
          at_most_once.is_satisfied_by(2).should be_false
          at_most_once.is_satisfied_by(0).should be_true

          at_most_twice.is_satisfied_by(2).should be_true
          at_most_twice.is_satisfied_by(3).should be_false
          at_most_twice.is_satisfied_by(0).should be_true
        end
      end
    end
  end
end
