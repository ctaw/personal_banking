class Credit < ActiveRecord::Base
  belongs_to :transaction_type

  def self.search(search)
    where("customer_name LIKE ?", "%#{search}%")
  end


end
