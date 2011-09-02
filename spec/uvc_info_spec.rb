require 'lib/uvc_info.rb'

describe UVCInfo do

  describe "Listing Devices" do
    it "should return an array of device hashes" do
      UVCInfo.devices.should be_kind_of( Array)
    end
  end
end
