class FolderReader
  attr_accessor :xml_doc, :album_count, :music_count
  def artists_to_xml(root)
    if File.directory?(root)
      path = Dir.new(root)
      path.each do |folder|
        if !(folder == ".." || folder == ".")
          art = Element.new("artist")
          art.add_attribute("name", folder)
          self.xml_doc.root.elements[1].elements << art
          albums_to_xml("#{root}/#{folder}/", art)
        end
      end
    end
  end
  
  def albums_to_xml(root, artist)
    if File.directory?(root)
      path = Dir.new(root)
      path.each do |folder|
        if !(folder == ".." || folder == ".")
            album = Element.new("album")
            album.add_attribute("name", folder)
            artist.elements << album
            self.album_count += 1
            songs_to_xml("#{root}#{folder}/", album)
        end
      end
    end
  end
  
  def songs_to_xml(root, album)
    if File.directory?(root)
      path = Dir.new(root)
      path.each do |folder| 
        if !(folder == ".." || folder == ".")
          songs = Element.new("track")
          songs.text = folder
          album.elements << songs
          self.music_count += 1
        end
      end
    end
  end
end