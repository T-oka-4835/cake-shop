class Order < ApplicationRecord
  enum pay_way: { "クレジットカード": 0, "銀行振込": 1 }
end
