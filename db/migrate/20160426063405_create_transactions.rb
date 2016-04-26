class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_code
      t.integer :status
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :company_name
      t.text :address
      t.string :contact_number
      t.timestamps
    end

    create_table :transactions do |t|
      t.integer :client_id
      t.string :client_code
      t.datetime :trasaction_date
      t.integer :credit_id
      t.integer :debit_id
      t.timestamps
    end

    create_table :transaction_types do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    create_table :credits do |t|
      t.decimal :amount
      t.string :transaction_type_id
      t.text :note
      t.integer :on_notification
      t.timestamps
    end

  end
end
