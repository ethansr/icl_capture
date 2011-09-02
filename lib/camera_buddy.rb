require 'rubygems'
require 'sys/filesystem'

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

  def list_video_devices
    command_results = `uvcdynctrl -l`
    lines = command_results.lines
    lines.collect do | line |
      line.split()
    end
  end

  def find_uvc_device
    @video_device = list_video_devices.find_all { |line| 
    line[1].match(/UVC/) }[0][0]
  end

  def list_audio_devices
    command_results = `arecord -l`
    lines = command_results.lines
    lines.collect do | line | 
      line.split()
    end
  end

  def find_audio_device
    @audio_device = list_audio_devices.find_all{ | line| 
    line[3].match(/USB/) if !line[3].nil?}[0][1].gsub(':','')
  end

end
