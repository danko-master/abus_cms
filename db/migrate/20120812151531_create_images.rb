class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      #t.string :name
      t.attachment :image
      t.integer :car_id, :default => -1
      t.integer :order_id, :default => -1

      t.timestamps
    end
    
    add_index :images, :car_id, :unique => false
  end
end
