module FileAccessor

  def reader(file_location)
    file = File.open(file_location, "r")
    message = file.read.strip
  end

  def writer(encryption, file_location)
    write_file = File.open(file_locaction, "w")
    write_file.write(cryption)
    write_file.close
  end
end
