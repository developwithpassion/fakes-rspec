require 'spec_helper'

module Fakes
  module RSpec
    describe ReceivedOccurrencesCriteria do
      let(:original){fake}
      let(:occurrence){fake}
      let(:the_call){fake}
      let(:arg_set){fake}
      let(:the_arg){1}
      subject{ReceivedOccurrencesCriteria.new(original,the_call,occurrence)}
      context "when matching a call made" do
        context "and the original criteria is not satisfied" do
          before (:each) do
            original.stub(:is_satisfied_by).with(the_arg).and_return(false)
          end
          it "should not match" do
            subject.is_satisfied_by(the_arg).should be_false
          end
          it "should not use the occurrence or the call" do
            occurrence.should_not have_received(:is_satified_by)
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
              occurrence.stub(:is_satisfied_by).with(1).and_return(true)
            end
            before (:each) do
              @result = subject.is_satisfied_by
            end
            it "should match if the occurrence matches the total number of invocations" do
              @result.should be_true
            end
          end
          context "and its occurrence is satisfied" do
            before (:each) do
              occurrence.stub(:is_satisfied_by).with(1).and_return(true)
            end
            it "should match" do
              subject.is_satisfied_by(the_arg).should be_true
            end
          end
          context "and its occurrence is not satisfied" do
            before (:each) do
              occurrence.stub(:is_satisfied_by).with(1).and_return(false)
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
