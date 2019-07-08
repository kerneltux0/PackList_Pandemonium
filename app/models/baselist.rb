class BaseList < ApplicationController

  def self.general
    ["identification", "itinerary", "house_keys", "maps", "insurance", "tickets", "emergency_contacts", "reservation_documents", "cash", "notepad", "pen/pencil", "guidebook"]

  end

  def self.electronics
    ["mobile_phone", "charging_cables", "tablet", "laptop", "mp3_player", "e-book_reader", "extra_batteries", "memory_cards", "headphones/earbuds", "camera"]

  end

  def self.camping
    ["compass", "tent", "tent_poles", "tent_stakes", "insect_repellant", "cooler", "crushed_ice", "fishing_pole", "bait/lures", "fishing_license", "snacks", "drinks", "coffee", "tarps", "rope", "bungee_cords", "multi-tool_kit", "hiking_shoes"]

  end

  def self.toiletries
    ["toothbrush", "toothpaste", "medications", "deodorant", "sunscreen", "soap", "epi_pen", "first_aid_kit", "nail-clippers/files", "make-up", "eye_drops", "feminine_hygene_products", "skin_care_lotions", "lip_balm"]

  end

  def self.clothing
    ["shirts", "pants", "shorts", "jacket", "hat(s)", "socks", "sunglasses", "shoes", "sandals", "sleepwear", "dresses/skirts", "laundry_bag", "belts", "sunglasses", "swimwear", "slippers"]

  end

  
end