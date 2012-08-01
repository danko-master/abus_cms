class AddDomainToPages < ActiveRecord::Migration
  def change
    add_column :pages, :domain, :text
  end
end
