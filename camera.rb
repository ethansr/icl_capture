require 'rubygems'
require 'sys/filesystem'
class CameraBuddy
  attr_accessor :video_device, :audio_device
  
  def initialize
    find_uvc_device
    find_audio_device

  end
  
  def record
    puts ffmpeg_command
  end
  
  def stop
    throw "I want to send q to ffmpeg"
  end
  
  def prep
    turn_off_aperature_priority
    turn_off_auto_focus
  end
  
  def ffmpeg_command
    command = ""
    command << "/usr/local/bin/ffmpeg "
    command << " -f video4linux2 -vcodec mjpeg -r 24 -s 1920x1080 -i /dev/#{video_device}"
    command << " -f alsa -ac 2 -i hw:#{@audio_device},0"
    command << " -vcodec copy -acodec libfaac"
    command << " #{destination_drive}/#{file_name}.avi"
command
  end
  
  def file_name
    `hostname`.strip + '_' +  Time.now.utc.strftime("%m-%d-%Y_%H:%M:%S")
  end
  
  def destination_drive
    
    mounted_drives = Dir.glob('/media/*').sort
    file_systems = mounted_drives.collect {| drive | [drive, Sys::Filesystem.stat(drive)] }
    destination = file_systems.find_all { |fs | 
(fs[1].blocks_available * fs[1].fragment_size).to_gb > expected_size }.first
	throw "Did not find" if destination.nil?
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
  
  def turn_off_aperature_priority
    system "uvcdynctrl -d#{@video_device} -s 'Exposure, Auto Priority' -- 0"
  end

  def turn_off_auto_focus 
    system "uvcdynctrl -d#{@video_device} -s 'Focus, Auto' -- 0"
  end
end

c = CameraBuddy.new
c.prep
c.record
