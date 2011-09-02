require 'lib/capture_buddy'

buddy = CaptureBuddy.new
command = ""
command << "DISPLAY=:0 guvcview"
command << " -d #{buddy.video_device[:file_system_device]}"
#command << " -g /usr/local/icl_capture/guvcsettings"
command << " -n #{buddy.file_system[:path]}/#{buddy.capture_name}.avi"
command << " -s 1920x1080"
command << " -f mjpeg"
command << " -t 25200"
command << " --exit_on_close"
puts command
