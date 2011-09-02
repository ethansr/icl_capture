require 'spec/spec_helper.rb'
require 'lib/capture_buddy'


describe CaptureBuddy do

  describe "create default camera buddy" do
    before :each do 
      stub_one_uvc_device
      stub_two_audio_devices
      @buddy = CaptureBuddy.new
    end
    it "should find a UVC camera" do
     @buddy.video_device[:label].should match /UVC/
    end
    it "should find a USB audio device" do
      @buddy.audio_device[:label].should match /USB/
    end
  end
end
