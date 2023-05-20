class User < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :pobatkovi, presence: true
  validates :phone, presence: true
  belongs_to :user_login
  belongs_to :status
  belongs_to :city
  has_many :advertisements
end
