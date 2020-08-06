require_relative 'artist'
require_relative 'mp3_importer'

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

    def self.new_by_filename(str)
        #artist,song, genre
        arr = str.split(" - ")
        artist = arr[0]
        song_name = arr[1]

        song = Song.new(song_name)
        song.artist_name = artist
        #Artist.find_or_create_by_name(artist)
        #binding.pry
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        #binding.pry
    end

end