class CreateTransactions < ActiveRecord::Migration
  def change
    # create_table :client_payments do |t|
    #   t.integer :client_id
    #   t.integer :client_transaction_id
    #   t.integer :payment_method # Cash or Cheque
    #   t.decimal :total_amount
    #   t.timestamps
    # end

    create_table :transaction_types do |t|
      t.string :name
      t.text :description
      t.timestamps
    end

    # create_table :client_transactions do |t|
    #   ## CLIENT
    #   t.string :client_name
    #   t.text :client_address
    #   t.string :client_contact_number
    #   t.string :plate_number
    #   t.datetime :transaction_date
    #   t.integer :on_notification
    #   t.timestamps
    # end

    create_table :credits do |t|
      t.datetime :transaction_date
      t.string :customer_name
      t.string :contact_number
      t.string :plate_number
      t.integer :transaction_type_id
      t.string :description
      t.decimal :amount
      t.datetime :reminders_date
      t.text :reminders_message
      t.timestamps
    end

    create_table :debits do |t|
      t.datetime :transaction_date
      t.string :customer_name
      t.string :contact_number
      t.string :plate_number
      t.integer :transaction_type_id
      t.string :description
      t.decimal :amount
      t.datetime :reminders_date
      t.text :reminders_message
      t.timestamps
    end

    # create_table :debits do |t|
    #   t.integer :client_transaction_id
    #   t.decimal :amount
    #   t.string :transaction_type_id
    #   t.text :note
    #   t.integer :on_notification
    #   t.timestamps
    # end

  end
end
