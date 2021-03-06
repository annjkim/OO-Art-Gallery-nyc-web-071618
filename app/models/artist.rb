require 'pry'
class Artist

  @@all = []

  attr_reader :name, :years_active

  def initialize(name, years_active)
    @name = name
    @years_active = years_active
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select do |painting|
      painting.artist == self
    end
  end

  def galleries
    paintings.map do |painting|
      painting.gallery
    end
  end

  def cities
    galleries.map do |gallery|
      gallery.city
    end
  end

  def self.average_year_of_experience
    year_sum = 0
      self.all.each do |artist|
        year_sum += artist.years_active
      end
    year_sum/self.all.length
  end

end
