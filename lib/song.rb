class Song 
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.songs << self
  end
  
  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
  end
  
  def self.new_by_filename(file_name)
    info = file_name.split(" - ")
    artist = info[0]
    name = info[1]
    new_song = self.new(name)
    new_song.artist_name=(artist)
    new_song
  end
  
  #class methods
  
  def self.all
    @@all 
  end
end


