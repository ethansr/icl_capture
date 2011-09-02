require 'lib/capture_buddy'

buddy = CameraBuddy.new

command << "guvcview"
command << "-d #{buddy.video_device[:label]}"
command << "-g /usr/local/capture/guvcsettings"
command << "-n #{buddy.file_system[:path]}/#{buddy.capture_name}"
command << "-t 25200"
command
