class BaseList < ApplicationController

  def self.general
    ["identification", "insurance", "tickets", "emergency_contacts", "reservation_documents"]

  end

  def self.electronics
    ["mobile_phone", "charging_cables", "tablet", "laptop", "mp3_player", "e_book_reader", "extra_batteries"]

  end

  def self.camping
    ["compass", "map", "tent", "tent_poles", "tent_stakes", "insect_repellant", "epi_pen", "cooler", "crushed_ice", "snacks", "coffee"]

  end

  def self.toiletries
    ["toothbrush", "toothpaste", "medications", "deodorant", "sunscreen", "soap", "first_aid_kit"]

  end

  def self.clothing
    ["shirts", "pants", "shorts", "jacket", "hat", "sunglasses", "shoes", "sandals", "sleepwear", "dress", "laundry_bag", "belts"]

  end

  
end