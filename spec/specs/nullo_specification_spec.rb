require 'spec_helper'

module Fakes
  module RSpec
    describe NulloSpecification do
      subject{NulloSpecification.instance}

      it "should be satisfied by anything" do
        [1,10,"a",Object.new].each do |item| 
          expect(subject.is_satisfied_by(item)).to be_truthy 
        end
      end
    end
  end
end
