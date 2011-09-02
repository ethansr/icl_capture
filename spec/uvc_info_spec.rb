require 'spec/spec_helper.rb'
require 'lib/uvc_info.rb'

describe UVCInfo do

  describe "Listing Devices" do
    describe "If devices are not present" do
      before :each do
        stub_no_uvc_devices
      end

      it "should return and empty array" do
        UVCInfo.devices.should == []
      end
    

    end
    describe "If devices are present" do
      before :each do
        stub_two_uvc_devices
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


      end

      describe "The first device" do
        it "should be 'video0'" do
          @first_device[:file_system_device].should == 'video1'
        end

        it "should be called 'UVC Camera (046d:0821)'" do
          @first_device[:label].should == 'UVC Camera (046d:0821)'
        end

      end
    end
  end
end
