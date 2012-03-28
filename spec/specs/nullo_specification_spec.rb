require 'spec_helper'

module RSpec
  module Fakes
    describe NulloSpecification do
      subject{NulloSpecification.instance}

      it "should be satisfied by anything" do
        [1,10,"a",Object.new].each{|item| subject.is_satisfied_by(item).should be_true}
      end
    end
  end
end
