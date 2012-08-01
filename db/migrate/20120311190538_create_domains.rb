class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.text :name

      t.timestamps
    end
  end
end
