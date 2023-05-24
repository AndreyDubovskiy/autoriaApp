class Price < ApplicationRecord
  include ActiveModel::Validations
  #@count
  validates :count, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :valute
  belongs_to :price_datum
end
