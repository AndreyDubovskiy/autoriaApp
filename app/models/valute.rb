class Valute < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :rate, presence: true, numericality: { float: true }
  has_many :prices
end
