module BinInstall
  module Shell
    def self.yes?(value)
      %w[y yes].include?(value.downcase)
    end

    def self.default_yes?(value)
      ['', 'y', 'yes'].include?(value.downcase)
    end

    def self.no?(value)
      %w[n no].include?(value.downcase)
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

        if file.read.include?(value)
          puts "Value already exist in #{path}. Skipping.".blue
        else
          puts "Writing to #{path}:\n#{value.to_s.cyan}"
          file << value.to_s
        end

        file.close
      end
    end

    def self.profile_paths
      [File.expand_path('~/.zshrc'), File.expand_path('~/.bash_profile')]
    end
  end
end
