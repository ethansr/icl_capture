require 'spec/spec_helper.rb'

describe AudioInfo do
  describe "Listing Devices" do
    describe "If devices are not present" do
      it "should return an empty array"
    end

    describe "If devices are present" do
      before :each do
          stub_two_audio_devices
          @devices = AudioInfo.devices
      end

      it "should return an array" do
        @devices.should be_kind_of(Array)
      end

      it "should return a hash of properties for each audio device" do
        @devices.first.should be_kind_of(Hash)
      end

      describe "The first device" do
        it "should be card '0'" do
          @devices.first[:card].should == '0'
        end
        it "should be labeled 'Intel [HDA Intel]'" do
          @devices.first[:label].should == "Intel [HDA Intel]"
        end
      end

      describe "The second device" do
        it "should be card '1'" do
          @devices[1][:card].should == '1'
        end
        it "should be labeled 'U0x46d0x991 [USB Device 0x46d:0x991]'" do
          @devices[1][:label].should == 'U0x46d0x991 [USB Device 0x46d:0x991]'
        end
        
      end
    end
  end
end
