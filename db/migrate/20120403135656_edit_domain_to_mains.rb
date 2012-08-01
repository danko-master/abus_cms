class EditDomainToMains < ActiveRecord::Migration
  def change
    remove_column :mains, :domain
    add_column :mains, :domain, :integer, :default => -1
  end
end
