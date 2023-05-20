class Advertisement < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :user
  has_one :auto
  has_many :price_data
  belongs_to :city
  has_many :photos
end
