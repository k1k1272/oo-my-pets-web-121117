require 'pry'
class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@owners = []

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@owners << self
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(fish)
    new_fish = Fish.new(fish)
    @pets[:fishes] << new_fish
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog)
    @pets[:dogs] << new_dog
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat)
    @pets[:cats] << new_cat
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each do |type, pets_array|
      pets_array.each {|pet| pet.mood = "nervous"}
    end
    @pets = {}
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end
