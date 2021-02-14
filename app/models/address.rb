class Address < ApplicationRecord

  belongs_to :customer

  def register_address
    postcode + " " + " " + address + " " + " "+ name
  end

end
