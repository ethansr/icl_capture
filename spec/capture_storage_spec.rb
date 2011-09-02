require 'spec/spec_helper.rb'
require 'lib/capture_storage.rb'

describe CaptureStorage do

  describe "Listing Storage Devices" do

    
    describe "External Storage Present" do
     it "should return an array of file systems" do
       CaptureStorage.file_systems.should be_kind_of(Array)
     end 

    end


    describe "No External Storage"
  end
end
