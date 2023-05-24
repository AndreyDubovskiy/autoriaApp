class Photo < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :advertisement
  has_one_attached :file, dependent: :destroy
end
