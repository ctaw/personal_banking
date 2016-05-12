class Credit < ActiveRecord::Base
  belongs_to :transaction_type
end
