require 'lib/capture_buddy'

describe CaptureBuddy do

  describe "create default camera buddy" do
    before :each do 
      @buddy = CaptureBuddy.new
    end
    it "should find a UVC camera" do
      @buddy.video_device[:label].should match /UVC/
    end
    it "should find a USB audio device" do
      @budy.audio_device[:label].should match /USB/
    end
  end
end
