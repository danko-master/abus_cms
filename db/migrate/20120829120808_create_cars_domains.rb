class CreateCarsDomains < ActiveRecord::Migration
  def change
    create_table :cars_domains do |t|
      t.references :car, :domain
      t.timestamps
    end
    
    add_index :cars_domains, [:car_id, :domain_id]
  end
end
