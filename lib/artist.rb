require_relative './concerns/findable.rb'


class Artist
  attr_accessor :name
  attr_reader :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless songs.include?(song)
  end

  def genres
    @songs.collect{|song| song.genre}.uniq
  end

  def save

  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    return artist
  end

  def self.destroy_all
    @@all = []
  end

end