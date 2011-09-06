$: << File.expand_path(File.dirname(__FILE__))
require "lib/capture_buddy.rb"


buddy = CaptureBuddy.new
command = ""
command << "env DISPLAY=:0 guvcview"
command << " -d #{buddy.video_device[:file_system_device]}"
#command << " -g /usr/local/icl_capture/guvcsettings"
command << " -n #{buddy.file_system[:path]}/#{buddy.capture_name}.avi"
command << " -s 1280x720"
command << " -f mjpg"
command << " -t 25200"
command << " --exit_on_close"
puts command
