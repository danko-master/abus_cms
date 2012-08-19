class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.integer :seats
      t.text :short
      t.text :long
      t.boolean :is_show
      t.boolean :is_special
      t.text :title
      t.text :metadescription
      t.text :metakeywords
      t.text :alias
      t.integer :price_hour
      t.integer :price_MKAD
      t.string :min_zakaz
      t.integer :transfer_sheremetevo
      t.integer :transfer_vnukovo
      t.integer :transfer_domodedovo
      t.integer :transfer_ostafevo
      t.integer :transfer_bikovo
      t.integer :transfer_airport_airport
      t.integer :transfer_airport_station
      t.integer :transfer_station_airport
      t.integer :weeding_price_hour
      t.integer :weeding_price_MKAD
      t.string :weeding_min_zakaz
      t.string :weeding_friday
      t.string :weeding_saturday
      t.string :weeding_decor
      t.string :holiday
      t.string :holiday_min_zakaz
      t.string :holiday_weeding_min_zakaz
      

      t.timestamps
    end
  end
end
