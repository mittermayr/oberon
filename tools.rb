module Tools

  def self.write_pid
    pidfile = "#{File.dirname(__FILE__)}/oberon.pid"
    begin
      File.open(pidfile, ::File::CREAT | ::File::EXCL | ::File::WRONLY){|f| f.write("#{Process.pid}") }
      at_exit { File.delete(pidfile) if File.exists?(pidfile) }
    rescue Errno::EEXIST
      check_pid
      retry
    end
  end


end
