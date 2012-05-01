require 'spec_helper'
require 'debugger'

module BadBot
  describe 'Detector' do
    class MockController < ActionController::Base
      include BadBot::Detector
    end

    subject { MockController.new }

    describe "#is_bot?" do

      BadBot::Bots.instance.bots.each do |bot|
        it "should return true if the request is from agent #{bot}" do
          request = OpenStruct.new
          request.user_agent = bot
          subject.stub(:request).and_return(request)
          subject.send(:detect_search_bots)
          subject.is_bot?.should be_true
        end
      end

    end

  end
end
