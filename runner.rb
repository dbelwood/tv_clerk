require 'listen'
require 'logger'

class Runner
  def self.run
    logger = Logger.new File.join(File.dirname(__FILE__), "log/run.log")
    # mkvCallback = Proc.new do |modified, added, removed|
    #   output_filename = modified[0].sub(/(.*)mkv/, '\1mp4')
    #   logger.info "HandBrakeCLI -i #{modified[0]} -o #{output_filename} --preset 'AppleTV 2'"
    # end
    # mkvListener = Listen.to('shows').filter(/\.mkv$/).change(&mkvCallback).start()
    Listen.to('shows', filter: /\.mkv$/) do |modified, added, removed|
      output_filename = modified[0].sub(/(.*)mkv/, '\1mp4')
      logger.info "HandBrakeCLI -i #{modified[0]} -o #{output_filename} --preset 'AppleTV 2'"
    end
  end
end