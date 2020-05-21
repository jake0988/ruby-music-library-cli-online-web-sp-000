require 'pry'
class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist=nil, genre=nil)
      @name = name
      @@all
  end

  def save
      @@all << self
  end

  def self.all
      @@all
  end

  def self.destroy_all
      @@all.clear
  end

  def self.create(name)
      a = self.new(name)
      @@all << a
  end

  def artist=(artist)
      @artist = artist
      Artist.song = self
  end

  def find_by_name(name)
      self.all.detect {|song| song.name == name}
  end

  def find_or_create_by_name(name)
      if !self.all.detect {|song| song.name == name}
          Song.new(name)
        end
  end
end
