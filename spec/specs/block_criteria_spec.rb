require 'spec_helper'

module Fakes
  module RSpec
    describe BlockCriteria do
      context "when matching" do
        subject{BlockCriteria.new(lambda{|item| return item == 1})}
        it "should match if its block returns true" do
          expect(subject.is_satisfied_by(1)).to be_truthy
          expect(subject.is_satisfied_by(2)).to be_falsy
        end
      end
    end
  end
end
