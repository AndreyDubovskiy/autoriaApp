class Valute < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  has_many :prices
end
