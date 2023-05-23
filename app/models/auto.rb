class Auto < ApplicationRecord
  include ActiveModel::Validations
  validates :is_new, inclusion: { in: [true, false] }
  validates :year, numericality: { only_integer: true, greater_than: 0 }
  validates :mileage, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  belongs_to :type_auto
  belongs_to :model_marka_auto
  belongs_to :type_kuzov
  belongs_to :country
  belongs_to :color
  belongs_to :type_fuel
  belongs_to :type_transmission
  belongs_to :type_drive_auto
  belongs_to :advertisement
end
