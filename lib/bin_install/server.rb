module BinInstall
  module Server
    def self.kill
      Dir.chdir(Dir.pwd) do
        pid_file = 'tmp/pids/server.pid'
        puts 'Server is not running!'.yellow unless File.exist?(pid_file)

        server_pid = `cat tmp/pids/server.pid`

        if system("kill -9 #{server_pid}")
          puts "PID #{server_pid} killed.".green
        else
          puts "PID #{server_pid} can not be killed!".red
        end
      end
    end

    def self.kill!
      Dir.chdir(Dir.pwd) do
        pid_file = 'tmp/pids/server.pid'
        abort('Server is not running!'.yellow) unless File.exist?(pid_file)

        server_pid = `cat tmp/pids/server.pid`

        if system("kill -9 #{server_pid}")
          puts "PID #{server_pid} killed.".green
        else
          abort("PID #{server_pid} can not be killed!".red)
        end
      end
    end
  end
end
