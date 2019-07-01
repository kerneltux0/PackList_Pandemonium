class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |aspects|
      aspects.string :name
      aspects.integer :list_id
    end
  end
end