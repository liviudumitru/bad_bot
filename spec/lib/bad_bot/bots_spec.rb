require 'spec_helper'

module BadBot
  describe "Bots" do

    subject { BadBot::Bots.instance }

    describe "#setup" do
      it "should manipulate the internal @bots arrays" do
        subject.setup do |bots|
          bots << "badbot1"
          bots << "badbot2"
          bots << "badbot3"
        end
        subject.bots.should include('badbot1')
        subject.bots.should include('badbot2')
        subject.bots.should include('badbot3')
      end
    end

  end
end
