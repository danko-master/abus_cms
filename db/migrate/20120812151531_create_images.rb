class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :image_file
      t.string :image_thumb_file
      t.integer :car_id
      t.integer :order_id

      t.timestamps
    end
  end
end
