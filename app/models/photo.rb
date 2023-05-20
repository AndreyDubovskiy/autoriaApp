class Photo < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  belongs_to :advertisement
end
