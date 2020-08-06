#require_relative './spec/fixtures/mp3s'
require_relative 'artist'
require_relative 'song'
require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        #binding.pry
       @path = path
    end

    def files
        all_files = Dir[@path+"/*.mp3"]
        all_files.map { |file| file.split("/")[-1] }
    end

    def import
        self.files.each { |file| Song.new_by_filename }
    end

end