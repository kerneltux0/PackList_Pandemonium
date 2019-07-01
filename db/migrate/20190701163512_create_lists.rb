class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |aspects|
      aspects.string :name
      aspects.string :items
      aspects.integer :user_id
    end
  end
end