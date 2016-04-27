class AddColumns < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :integer
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :clients, :plate_number, :string
  end
end
