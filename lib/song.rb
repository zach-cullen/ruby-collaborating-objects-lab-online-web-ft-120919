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
    name = info[0]
    artist = info[1]
    song = Song.new(name)
    song.artist_name=(artist)
  end
  
  #class methods
  
  def self.all
    @@all 
  end
end


