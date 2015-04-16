require 'spec_helper'

module Fakes
  module RSpec
    describe ReceivedCriteria do
      context "when matching a call made without arguments" do
        it "should match if the call was made" do
          item = fake
          item.hello

          sut = ReceivedCriteria.new(item.received(:hello))

          expect(sut.is_satisfied_by).to be_truthy
        end
      end
      context "when matching a call made with arguments" do
        let(:item){fake}
        before (:each) do
          item.hello("world")
          @sut = ReceivedCriteria.new(item.received(:hello))
        end
        context "and we care about the arguments it was called with" do
          it "should match if it received the correct call" do
            expect(@sut.is_satisfied_by("world")).to be_truthy
          end
          it "should not match if the arguments provided are not in the call history" do
            expect(@sut.is_satisfied_by("yo")).to be_falsy
          end

        end
        context "and we don't care about the arguments it was called with" do
          it "should match if it received a call to the method" do
            expect(@sut.is_satisfied_by).to be_truthy
          end
        end
      end
    end
  end
end
