require "rexml/document"
require "FolderReader"
require "XMLCreator"
require "config"
include REXML

run = XMLCreator.new
run.initiate
run.process
run.create_file