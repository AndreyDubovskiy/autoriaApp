class PriceDatum < ApplicationRecord
  @date
  has_one :price
  belongs_to :advertisement
end
