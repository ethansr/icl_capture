class UVCInfo

  def self.devices
    extract_device_information
  end


  def self.extract_device_information
    device_list = uvc_list.lines.find_all { |line| line.match /video/ }

    device_list.collect { |line| parse_device_line line }
  end

  def self.parse_device_line device_string
    match = device_string.match /(video\d*)\s*(.*)/
     
      { :file_system_device => match[1],
        :label => match[2].strip      }

  end

  def self.uvc_list
    `uvcdynctrl -l` 
  end
end
