class EditDomainToPages < ActiveRecord::Migration
  def change
    remove_column :pages, :domain
    add_column :pages, :domain, :integer, :default => -1
  end
end
