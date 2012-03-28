require 'spec_helper'

module Fakes
  module RSpec
    describe ReceivedOccurencesCriteria do
      let(:original){fake}
      let(:occurence){fake}
      let(:the_call){fake}
      let(:arg_set){fake}
      let(:the_arg){1}
      subject{ReceivedOccurencesCriteria.new(original,the_call,occurence)}
      context "when matching a call made" do
        context "and the original criteria is not satisfied" do
          before (:each) do
            original.stub(:is_satisfied_by).with(the_arg).and_return(false)
          end
          it "should not match" do
            subject.is_satisfied_by(the_arg).should be_false
          end
          it "should not use the occurence or the call" do
            occurence.should_not have_received(:is_satified_by)
            the_call.should_not have_received(:called_with)
          end
        end
        context "and the original criteria is satisfied" do
          before (:each) do
            original.stub(:is_satisfied_by).with(the_arg).and_return(true)
            the_call.stub(:called_with).with(the_arg).and_return(arg_set)
            arg_set.stub(:times_called).and_return(1)
          end
          context "and no arguments were provided to the call" do
            before (:each) do
              original.stub(:is_satisfied_by).and_return(true)
              the_call.stub(:total_times_called).and_return(1)
              occurence.stub(:is_satisfied_by).with(1).and_return(true)
            end
            before (:each) do
              @result = subject.is_satisfied_by
            end
            it "should match if the occurence matches the total number of invocations" do
              @result.should be_true
            end
          end
          context "and its occurence is satisfied" do
            before (:each) do
              occurence.stub(:is_satisfied_by).with(1).and_return(true)
            end
            it "should match" do
              subject.is_satisfied_by(the_arg).should be_true
            end
          end
          context "and its occurence is not satisfied" do
            before (:each) do
              occurence.stub(:is_satisfied_by).with(1).and_return(false)
            end
            it "should not match" do
              subject.is_satisfied_by(the_arg).should be_false
            end
          end
        end
      end
    end
  end
end
