require 'lib/capture_buddy'

buddy = CaptureBuddy.new
command = ""
command << "guvcview"
command << "-d #{buddy.video_device[:label]}"
command << "-g /usr/local/icl_capture/guvcsettings"
command << "-n #{buddy.file_system[:path]}/#{buddy.capture_name}"
command << "-t 25200"
command
