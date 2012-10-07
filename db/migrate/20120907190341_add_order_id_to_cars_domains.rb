class AddOrderIdToCarsDomains < ActiveRecord::Migration
  def change
    add_column :cars_domains, :order_id, :int, :default => -1, :null => false
  end
end
