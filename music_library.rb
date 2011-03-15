require "rexml/document"
require "lib/folder_reader"
require "lib/xml_creator"
require "lib/config"
include REXML

run = XMLCreator.new
run.initiate
run.process
run.create_file