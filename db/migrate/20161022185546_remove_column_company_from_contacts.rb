class RemoveColumnCompanyFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :company, :string
  end
end
