module BinInstall
  module Brew
    module Service
      def self.run(service)
        if started?(service)
          puts "Service #{service} already started. Skipping.".blue
        else
          system("brew services run #{service}")
        end
      end

      def self.run!(service)
        if started?(service)
          puts "Service #{service} already started. Skipping.".blue
        else
          BinInstall.system!("brew services run #{service}")
        end
      end

      def self.start(service)
        if started?(service)
          puts "Service #{service} already started. Skipping.".blue
        else
          system("brew services start #{service}")
        end
      end

      def self.start!(service)
        if started?(service)
          puts "Service #{service} already started. Skipping.".blue
        else
          BinInstall.system!("brew services start #{service}")
        end
      end

      def self.stop(service)
        if stopped?(service)
          puts "Service #{service} already stopped. Skipping.".blue
        else
          system("brew services stop #{service}")
        end
      end

      def self.stop!(service)
        if stopped?(service)
          puts "Service #{service} already stopped. Skipping.".blue
        else
          BinInstall.system!("brew services stop #{service}")
        end
      end

      def self.restart(service)
        system("brew services restart #{service}")
      end

      def self.restart!(service)
        BinInstall.system!("brew services restart #{service}")
      end

      def self.started?(service)
        services[service.to_sym] == :started
      end

      def self.stopped?(service)
        services[service.to_sym] == :stopped
      end

      def self.services
        output = `brew services list`
        lines = output.split("\n")
        lines.shift # Remove header from table.

        lines.map do |row|
          columns = row.split(' ')
          [columns[0].to_sym, columns[1].to_sym]
        end.to_h
      end
    end
  end
end
