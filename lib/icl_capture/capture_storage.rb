class CaptureStorage

  def self.file_systems
    mounted_drives.collect do | drive |
      stat = Sys::Filesystem.stat(drive)
      {
        :path => drive,
        :free_space => free_space_for(stat),
        :stat => stat
      }
    end
  end

  def self.mounted_drives
    Dir.glob('/media/*').sort
  end

  def self.free_space_for fs
    (fs.blocks_available * fs.fragment_size).to_gb
  end



end
