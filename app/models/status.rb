class Status < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  has_many :users
end
