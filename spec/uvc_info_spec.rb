require 'lib/uvc_info.rb'

describe UVCInfo do

  describe "Listing Devices" do
    describe "If devices are not present" do
      before :each do
        UVCInfo.stub!(:uvc_list).and_return("
Listing available devices:
No devices found.")
      end

      it "should return and empty array" do
        UVCInfo.devices.should == []
      end
    

    end
    describe "If devices are present" do
      before :each do
        UVCInfo.stub!(:uvc_list).and_return(    "
[libwebcam] Unknown V4L2 private control ID encountered: 0x0A046D04 (V4L2_CID_PRIVATE_BASE + 33844484)
Listing available devices:
  video0   UVC Camera (046d:0991)
    ")
    @devices =  UVCInfo.devices
        @first_device = @devices.first

      end
      it "should return an array" do
       @devices.should be_kind_of( Array)
      end

      it "should provide a hash of properties for each camera" do
        @devices.first.should be_kind_of(Hash)
      end

      describe "Device Hash" do
        it "should have a device filesystem name" do
          @first_device.should have_key(:file_system_device)
        end
    
        it "should have a device label" do 
          @first_device.should have_key(:label)
        end

        it "should have a USB device identifier" do
          @first_device.should have_key(:usb_id)
        end

      end

      describe "The first device" do
        it "should be 'video0'" do
          @first_device[:file_system_device].should == 'video0'
        end

        it "should be called 'UVC Camera'" do
          @first_device[:label].should == 'UVC Camera'
        end

        it "should have the identifier '(046d:0991)'" do
          @first_device[:usb_id].should == '(046d:0991)'
        end
      end
    end
  end
end
