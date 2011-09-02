require 'rubygems'
require 'sys/filesystem'
require 'lib/uvc_info.rb'
require 'lib/audio_info.rb'

class CaptureBuddy

  attr_accessor :video_device, :audio_device
  
  def initialize
    find_uvc_device
    find_audio_device

  end

  def destination_drive
    
    mounted_drives = Dir.glob('/media/*').sort
    file_systems = mounted_drives.collect {| drive | [drive, Sys::Filesystem.stat(drive)] }

    destination = file_systems.find_all { |fs | (fs[1].blocks_available * fs[1].fragment_size).to_gb > expected_size }.first

    throw "Did not find a capture drive with enough space" if destination.nil?

    destination[0]
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
