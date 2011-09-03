class AudioInfo

  def self.devices
    extract_audio_device_information
  end

  def self.extract_audio_device_information
    audio_devices = audio_device_list.lines.find_all {|line| line.match /card/}
    audio_devices.collect {|device| parse_line device }
  end

  def self.parse_line device_string
    match = device_string.match /card (\d*): (.*), device (\d*):/
    {:card => match[1],
      :label => match[2],
     :device => match[3]}
  end

  def self.audio_device_list
    `arecord -l`
  end
end
