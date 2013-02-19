require './plugins'

interactor :off
#filter! /\.mp4$/, /\.mkv$/, /\.rar$/

# guard :shell do
 #  watch(/(.*).mp4$/) do |m|
 #    n "MP4 detected"
 #  end

	# watch(/(.*).rar$/) do |m|
 #    n "RAR detected"
 #  end

guard :mkv do
  watch /shows\/.*(?<!sample).mkv/
end

guard :rar do
  watch /shows\/.*.rar$/
end

guard :mp4 do
  watch /shows\/.*.mp4$/
end