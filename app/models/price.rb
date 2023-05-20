class Price < ApplicationRecord
  @count
  belongs_to :valute
  belongs_to :price_datum
end
