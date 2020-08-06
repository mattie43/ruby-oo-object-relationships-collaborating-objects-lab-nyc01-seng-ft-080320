require_relative 'song'
require_relative 'mp3_importer'
require 'pry'

class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        #binding.pry
        song.artist = self
    end
    
    def songs
        #binding.pry
        Song.all.select { |song| song.artist == self }
    end

    def self.find_by_name(name)
        self.all.find { |artist| artist.name == name }            
    end

    def self.find_or_create_by_name(artist_name)
        artist_check = self.find_by_name(artist_name)
        #binding.pry
        return artist_check if artist_check != nil
        Artist.new(artist_name)
    end

    def print_songs
        songs.each { |ele| puts ele.name }
    end

end