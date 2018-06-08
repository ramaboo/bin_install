module BinInstall
  module Brew
    module Package
      def self.install(package)
        system("brew install #{package}")
      end

      def self.install!(package)
        BinInstall.system!("brew install #{package}")
      end

      def self.upgrade(package)
        if latest_version?(package)
          puts "#{package} is already the latest version. Skipping.".blue
        else
          system("brew upgrade #{package}")
        end
      end

      def self.upgrade!(package)
        if latest_version?(package)
          puts "#{package} is already the latest version. Skipping.".blue
        else
          BinInstall.system!("brew upgrade #{package}")
        end
      end

      def self.install_or_upgrade(package)
        if installed?(package)
          upgrade(package)
        else
          install(package)
        end
      end

      def self.install_or_upgrade!(package)
        if installed?(package)
          upgrade!(package)
        else
          install!(package)
        end
      end

      def self.installed?(package)
        system("brew list --versions #{package}")
      end

      def self.latest_version?(package)
        system("brew outdated #{package}")
      end
    end
  end
end
