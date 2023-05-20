class City < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  has_many :users
  has_many :advertisements
end
