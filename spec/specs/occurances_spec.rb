require 'spec_helper'

module DevelopWithPassion
  module Fakes
    module RSpec
      describe Occurances do
        context "when creating an exact occurance matcher" do
          subject{Occurances.exact(1)}

          it "should create a matcher that matches an exact number of occurances" do
            subject.is_satisfied_by(1).should be_true
            subject.is_satisfied_by(2).should be_false
          end
        end

        context "when creating an at least occurance matcher" do
          subject{Occurances.at_least(3)}

          it "should create a matcher that matches an exact number of occurances" do
            subject.is_satisfied_by(3).should be_true
            subject.is_satisfied_by(4).should be_true
            subject.is_satisfied_by(2).should be_false
          end
        end
        context "when creating an at most occurance matcher" do
          subject{Occurances.at_most(3)}

          it "should create a matcher that matches an exact number of occurances" do
            subject.is_satisfied_by(3).should be_true
            subject.is_satisfied_by(2).should be_true
            subject.is_satisfied_by(1).should be_true
            subject.is_satisfied_by(4).should be_false
          end
        end
      end
    end
  end
end
