class Country < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  has_many :autos
end
