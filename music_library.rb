require "rexml/document"
require "lib/folder_reader"
require "lib/xml_creator"
require "lib/config"
include REXML
require 'optparse'
require 'ostruct'

folder = FOLDER
save_at = SAVE_AT
lib_name = LIBRARY_NAME

options = OpenStruct.new
options.encoding = "utf8"

OptionParser.new do |opts|
  opts.banner = "Usage: music_library.rb [options]"
  opts.on("-h", "--help", "Help") do |h|
    puts opts
    exit
  end

  opts.on("-o folder,save_at,lib_name", Array,
          "Override config file.", "It needs to point to the folder where your music collection is located,",
          "to the folder where you plan    to save the xml file and the name you want",
          "to give to your music library.","ruby music_libray.rb '/Folder/Music','/Folder/File','My_Library'",
          "Don't put spaces in the library name!") do |list|
    options.list = list

    folder = options.list[0]
    save_at = options.list[1]
    lib_name = options.list[2]

    if !File.directory?(folder)
      puts "You need to point to a folder for the options 'folder'"
      exit
    end

    if !File.directory?(save_at)
      puts "You need to point to a folder for the options 'save_at'"
      exit
    end

  end
end.parse!

run = XMLCreator.new
run.initiate
run.process(lib_name, folder)
run.create_file(save_at)