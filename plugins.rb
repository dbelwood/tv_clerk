require 'guard/guard'
require 'shellwords'

module ::Guard
  class Mkv < ::Guard::Guard
    def run_on_additions(paths)
      jobs = []
      delete_commands = []
      paths.each do |path|
        path = Shellwords.escape path
        delete_commands << "rm #{path}"
        output_filename = path.sub(/(.*)mkv/, '\1mp4')
        jobs << "./bin/HandBrakeCLI -i #{path} -o #{output_filename} --preset 'AppleTV 2'"
      end
      `#{jobs.join(";")}`
      # Delete source mkvs
      `#{delete_commands.join(";")}`
    end
  end

  class Rar < ::Guard::Guard
    def run_on_additions(paths)
      paths.each do |path|
        path = Shellwords.escape path
        containing_directory = File.dirname(path)
        `unrar x #{path} #{containing_directory}`
        # Remove all rar, pars and parts
        
      end
    end
  end

  class Mp4 < ::Guard::Guard
    ITUNES_PATH = '~/Music/iTunes/iTunes\ Media/Automatically\ Add\ to\ iTunes'
    def run_on_additions(paths)
      paths.each do |path|
        path = Shellwords.escape path
        containing_directory = File.expand_path(File.dirname(path))
        `mv #{path} #{ITUNES_PATH}`
        puts containing_directory
        if containing_directory =~ /.*(?<!shows)$/
          puts containing_directory
          `rm -rf containing_directory`
        else
          `rm path`
        end
      end
    end
  end
end
