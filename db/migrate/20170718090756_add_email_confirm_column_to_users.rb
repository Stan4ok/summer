class AddEmailConfirmColumnToUsers < ActiveRecord::Migration[5.1] #this was an unnecessary step, just did not know how to rollback because of foreign keys
  def change
    add_column :users, :email_confirmed, :boolean, :default => false
    add_column :users, :confirm_token, :string
  end
end
