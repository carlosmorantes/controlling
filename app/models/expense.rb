class Expense < ActiveRecord::Base
  validates :date, presence: true
  validates :article, presence: true	
  validates :price, presence: true
end
