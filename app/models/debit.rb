class Debit < ActiveRecord::Base
  # belongs_to :transaction_type

  def self.search(search)
    where('lower(customer_name) LIKE ?', '%' + search.downcase + '%')
  end

end
