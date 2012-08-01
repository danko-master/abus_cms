class AddDomainToMains < ActiveRecord::Migration
  def change
    add_column :mains, :domain, :text
  end
end
