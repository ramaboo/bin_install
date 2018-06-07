module BinInstall
  module Shell
    def self.yes?(value)
      ['y', 'yes'].include?(value.downcase)
    end

    def self.default_yes?(value)
      ['', 'y', 'yes'].include?(value.downcase)
    end

    def self.no?(value)
      ['n', 'no'].include?(value.downcase)
    end

    def self.default_no?(value)
      ['', 'n', 'no'].include?(value.downcase)
    end

    def self.executable_exists?(executable)
      system("which #{executable}")
    end

    def self.append_to_profiles(value)
      profile_paths.each do |path|
        file = File.open(path, 'a+')
        contents = file.read

        if contents.include?(value)
          puts "Writing to #{path}:\n"
          puts value.to_s.white
          file << value.to_s
        else
          puts "String found in #{path}. Skipping.".blue
        end

        file.close
      end
    end

    def self.profile_paths
      [File.expand_path('~/.zshrc'), File.expand_path('.bash_profile')]
    end
  end
end
