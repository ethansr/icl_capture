require 'spec/spec_helper.rb'
require 'lib/capture_buddy'


describe CaptureBuddy do

  describe "create default camera buddy" do
    before :each do 
      stub_two_uvc_devices
      stub_two_audio_devices
      stub_one_good_file_system
      @buddy = CaptureBuddy.new
    end
    it "should find a UVC camera" do
     @buddy.video_device[:label].should match /UVC/
    end
    it "should find a USB audio device" do
      @buddy.audio_device[:label].should match /USB/
    end
    it "should use the first capture drive" do
      @buddy.file_system[:path].should == '/media/capture_1'
    end
  end
end
