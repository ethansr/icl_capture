
def stub_one_good_file_system
  CaptureStorage.stub(:file_systems).and_return([{:path => '/media/capture_1', :free_space => 2700}])
end

def stub_no_uvc_devices
UVCInfo.stub!(:uvc_list).and_return("Listing available devices:\nNo devices found.")
end

def stub_one_uvc_device
        UVCInfo.stub!(:uvc_list).and_return(    "
[libwebcam] Unknown V4L2 private control ID encountered: 0x0A046D04 (V4L2_CID_PRIVATE_BASE + 33844484)
Listing available devices:
  video0   UVC Camera (046d:0991)
    ")

end

def stub_two_audio_devices
          AudioInfo.stub!(:audio_device_list).and_return(
          "
**** List of CAPTURE Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC262 Analog [ALC262 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: U0x46d0x991 [USB Device 0x46d:0x991], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
          ")

end
