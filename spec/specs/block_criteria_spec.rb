require 'spec_helper'

module DevelopWithPassion
  module Fakes
    module RSpec
      describe BlockCriteria do
        context "when matching" do
          subject{BlockCriteria.new(lambda{|item| return item == 1})}
          it "should match if its block returns true" do
            subject.is_satisfied_by(1).should be_true
            subject.is_satisfied_by(2).should be_false
          end
        end
      end
    end
  end
end
