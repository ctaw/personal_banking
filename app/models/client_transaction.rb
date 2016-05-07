class ClientTransaction < ActiveRecord::Base
  has_many :credits
  validates_associated :credits
  accepts_nested_attributes_for :credits,  :reject_if => :all_blank, :allow_destroy => true

  has_many :debits
  validates_associated :debits
  accepts_nested_attributes_for :debits,  :reject_if => :all_blank, :allow_destroy => true
end
