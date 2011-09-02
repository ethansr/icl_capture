require 'lib/uvc_info.rb'
require 'lib/audio_info.rb'

class CaptureBuddy

  attr_accessor :video_device, :audio_device
  
  def initialize
    find_uvc_device
    find_audio_device

  end
  def expected_size
    250
  end

  def find_uvc_device
    @video_device = UVCInfo.devices.find_all {|device| 
    device[:label].match(/UVC/) }.first
  end

  def find_audio_device
    @audio_device = AudioInfo.devices.find_all{ | device| 
    device[:label].match(/USB/)}.first  
  end

end
