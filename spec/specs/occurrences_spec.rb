require 'spec_helper'

module Fakes
  module RSpec
    describe Occurrences do
      context "when creating an exact occurrence matcher" do
        subject{Occurrences.exact(1)}

        it "should create a matcher that matches an exact number of occurrences" do
          expect(subject.is_satisfied_by(1)).to be_truthy
          expect(subject.is_satisfied_by(2)).to be_falsy
        end
      end

      context "when creating an at least occurrence matcher" do
        subject{Occurrences.at_least(3)}

        it "should create a matcher that matches an exact number of occurrences" do
          expect(subject.is_satisfied_by(3)).to be_truthy
          expect(subject.is_satisfied_by(4)).to be_truthy
          expect(subject.is_satisfied_by(2)).to be_falsy
        end
      end
      context "when creating an at most occurrence matcher" do
        subject{Occurrences.at_most(3)}

        it "should create a matcher that matches an exact number of occurrences" do
          expect(subject.is_satisfied_by(3)).to be_truthy
          expect(subject.is_satisfied_by(2)).to be_truthy
          expect(subject.is_satisfied_by(1)).to be_truthy
          expect(subject.is_satisfied_by(4)).to be_falsy
        end
      end
    end
  end
end
