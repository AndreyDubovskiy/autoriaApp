class MarkaAuto < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  has_many :model_marka_autos
end
