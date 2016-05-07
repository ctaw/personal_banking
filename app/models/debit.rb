class Debit < ActiveRecord::Base
  belongs_to :client_transaction
end
