class Cart < ApplicationRecord

  belongs_to :customer
  belongs_to :items 
  
end
