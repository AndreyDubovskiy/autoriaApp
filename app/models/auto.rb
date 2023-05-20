class Auto < ApplicationRecord
  @is_new
  @year
  @miliage
  belongs_to :type_auto
  belongs_to :model_marka_auto
  belongs_to :type_kuzov
  belongs_to :country
  belongs_to :color
  belongs_to :type_fuel
  belongs_to :type_transmission
  belongs_to :type_drive_auto
end
