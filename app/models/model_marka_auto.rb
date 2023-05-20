class ModelMarkaAuto < ApplicationRecord
  include ActiveModel::Validations
  validates :model, presence: true
  has_many :autos
  belongs_to :marka_auto
end
