class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |aspects|
      aspects.string :username
      aspects.string :password_digest
      aspects.string :lists 
    end     
  end
end