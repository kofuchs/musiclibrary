class XMLCreator
  attr_accessor :reader
  def initiate
    self.reader = FolderReader.new
    self.reader.xml_doc = Document.new
    self.reader.album_count = 0
    self.reader.music_count = 0
  end
  
  def add_element(el)
    self.reader.xml_doc.add_element(el)
  end
  
  def add_root_element(el)
    self.reader.xml_doc.root.add_element(el)
  end
  
  def process
    self.add_element(LIBRARY_NAME)
    self.add_root_element("music")
    self.add_root_element("info")
    
    self.reader.artists_to_xml(FOLDER)

    add_info_param("artists", self.reader.xml_doc.root.elements[1].to_a.length)
    add_info_param("albums", self.reader.album_count)
    add_info_param("songs", self.reader.music_count)
  end
  
  def add_info_param(key, value)
    param = Element.new(key)
    param.add_attribute("total", value.to_s)
    self.reader.xml_doc.root.elements[1].elements << param
  end
  
  def create_file
    file = File.new("#{SAVE_AT}/Library #{Time.now.month}-#{Time.now.day}-#{Time.now.year}.xml", "w")
    file << "<?xml version='1.0' encoding='UTF-8'?>"
    file << self.reader.xml_doc
  end
end