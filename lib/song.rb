class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all
        @@all
    end 

    def self.new_by_filename(filename)
        artist_name = filename.split(" - ")[0]
        songs = filename.split(" - ")[1]
        song = self.new(songs)
        song.artist_name = artist_name
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        self.artist = artist
        artist.add_song(self)
    end

end