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
      profile_filenames.each do |filename|
        file = File.open(filename, 'a+')
        contents = file.read
        file << value unless contents.include?(value)
        file.close
      end
    end

    def self.profile_filenames
      [File.expand_path('~/.zshrc'), File.expand_path('.bash_profile')]
    end
  end
end
